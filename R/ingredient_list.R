#' Ingredient list
#'
#' This function 
#' @return A sparse matrix with the computed combined tf-idf
ingredient_list <- function(add_new = NULL) {
  
  if (!is.null(add_new)) stop("Not ready for that yet.")
  
  cmap_data <- "data/CMAP2.RData"
  ctd_data <- "data/CTD_mRNA-effects-human.Rdata"
  lincs_data <- "data/LINCS_L1000.RData"
  small_molecules <- "data/SmallMoleculePerturbations.RData"
  natural_products <- "data/GSE85871_natural_products.RData"
  
  return(list(cmap = cmap_data, 
              ctd = ctd_data, 
              lincs = lincs_data, 
              small_molecules = small_molecules, 
              natural_products = natural_products))
}