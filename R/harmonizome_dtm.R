harmonizome_dtm <- function(harmonizome_dataset) {
  
  # load(harmonizome_dataset)
  
  ds_up <- dataset$M
  ds_down <- dataset$M
  
  ds_up[ds_up == -1] <- 0
  ds_down[ds_down == 1] <- 0
  ds_down <- ds_down * -1
  
  gup <- paste(dataset$G$var2, "up")
  gdown <- paste(dataset$G$var2, "down")
  
  ds <- rbind(ds_up, ds_down)
  ds <- t(ds)
  colnames(ds) <- c(gup, gdown)
  
  return(list(matrix = ds, drug_names = as_tibble(dataset$S)))
}

