# geo_data: data matrix with drugs on rows, genes on columns. 
#           should be filtered after differential expression, and should be a -1, 0, 1 matrix for drug effect
#
# drug_names: names of drugs in the data set
# gene_ids: colnames of geo_data, should be entrez ids.
geo_matrix <- function(geo_data, drug_names, gene_ids) {
  
  genes_up <- paste(gene_ids, "up")
  genes_down <- paste(gene_ids, "down")
  
  ds_up <- geo_data
  ds_down <- geo_data
  
  ds_up[ds_up == -1] <- 0
  ds_down[ds_down == 1] <- 0
  ds_down <- ds_down * -1
  
  gup <- paste(gene_ids, "up")
  gdown <- paste(gene_ids, "down")
  
  ds <- cbind(ds_up, ds_down)
  ds <- Matrix::Matrix(ds, sparse = TRUE)
  colnames(ds) <- c(gup, gdown)
  
  return(list(matrix = ds, drug_names = drug_names))
}