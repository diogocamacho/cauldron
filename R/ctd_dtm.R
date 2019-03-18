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
    as_data_frame %>% 
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
    
    # x3 <- subset(x2, drug_effect == "decreases expression")
    # if(nrow(x3) != 0) {
    #   y1 <- paste(x3$drug_target_ids, "down")
    #   y2 <- which(colnames(D) %in% y1)
    #   D[i, y2] <- 1
    # }
    # 
    # x4 <- subset(x2, drug_effect == "increases expression")
    # if(nrow(x4) != 0) {
    #   z1 <- paste(x4$drug_target_ids, "up")
    #   z2 <- which(colnames(U) %in% z1)
    #   U[i, z2] <- 1
    # }
  }
  
  # drug_matrix <- cbind(U, D)
  
  tmp_df <- as_tibble(df[match(udrugs, df$drug_id), ]) %>%
    dplyr::select(., drug_name)
  
  
  return(list(matrix = M, drug_names = tmp_df))
  
}