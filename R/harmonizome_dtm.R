harmonizome_dtm <- function(data_file) {
  
  load_obj <- function(f)
  {
    env <- new.env()
    nm <- load(f, env)[1]
    env[[nm]]
  }
  
  xx <- load_obj(data_file)
  
  ds_up <- xx$M
  ds_down <- xx$M
  
  ds_up[ds_up == -1] <- 0
  ds_down[ds_down == 1] <- 0
  ds_down <- ds_down * -1
  
  gup <- paste(xx$G$var2, "up")
  gdown <- paste(xx$G$var2, "down")
  
  ds <- rbind(ds_up, ds_down)
  ds <- t(ds)
  colnames(ds) <- c(gup, gdown)
  
  return(list(matrix = ds, drug_names = as_tibble(xx$S)))
}

