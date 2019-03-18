# drug_matrix <- matrix(0,ncol=length(all_effects),nrow=(nrow(cmap_dm) + nrow(geo_dm) + nrow(ctd_dm)))
# drug_matrix <- Matrix(data = drug_matrix,sparse = TRUE)
# colnames(drug_matrix) <- all_efects
standardize_matrices <- function(all_effects, drug_matrix)
{
  sdm <- Matrix::Matrix(0, nrow = nrow(drug_matrix), ncol = length(all_effects))
  colnames(sdm) <- all_effects
  for(i in seq(1, nrow(drug_matrix)))
  {
    x1 <- names(which(drug_matrix[i, ] == 1))
    x2 <- which(all_effects %in% x1)
    sdm[i, x2] <- 1
  }
  return(sdm)
}