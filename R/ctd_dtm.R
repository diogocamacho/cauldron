ctd_dtm <- function(ctd_data)
{
  udrugs <- unique(ctd_data$drug_id)
  ugenes <- unique(ctd_data$drug_target_ids)
  
  genes_up <- paste(ugenes, "up")
  genes_down <- paste(ugenes, "down")

  U <- Matrix::Matrix(data = 0, nrow = length(udrugs), ncol = length(ugenes), sparse = TRUE) # positive association matrix
  D <- U # negative association matrix
  colnames(U) <- genes_up
  colnames(D) <- genes_down
  
  M <- cbind(U, D)
  
  df <- ctd_data %>% 
    as_tibble %>% 
    dplyr::select(., drug_id, drug_name, drug_target_ids, drug_effect) %>% 
    dplyr::mutate(., direction = "up") %>% 
    dplyr::mutate(., direction = replace(x = direction, list = drug_effect == "decreases expression", values = "down")) %>% 
    dplyr::mutate(., gene_effect = paste(drug_target_ids, direction))
  
  for(i in seq(1, length(udrugs))) {
    
    x1 <- df %>% 
      dplyr::filter(., drug_id == udrugs[i]) %>%
      dplyr::select(., gene_effect) %>% as.matrix %>%
      as.vector
    
    M[i, which(colnames(M) %in% x1)] <- 1
    
  }

  tmp_df <- as_tibble(df[match(udrugs, df$drug_id), ]) %>%
    dplyr::select(., drug_name)
  
  return(list(matrix = M, drug_names = tmp_df))
  
}