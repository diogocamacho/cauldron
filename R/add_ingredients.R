#' Add ingredients
#'
#' This function takes in data from multiple sources and generates a drug-term matrix as required by `DRUID`.
#' 
#' @param cmap_data Data from CMAP2 from the Harmonizome
#' @param small_molecules Data from small molecules treatments on cell lines obtained from the Harmonizome
#' @param ctd_data Data from CTD, filtered on mRNA effects from drugs
#' @param np_data Data on MCF7 cell lines treated with natural products from traditional chinese medicine
#' @param lincs_data Data from LINCS L1000 from the Harmonizome
#' @return A list of TF-IDF matrices and respective cross-product vectors.
add_ingredients <- function(cmap_data, 
                            small_molecules, 
                            ctd_data, 
                            np_data, 
                            lincs_data, 
                            new_data = NULL)
{
  
  if(!is.null(new_data)) stop("Not ready for that yet.")
  
  # CMAP data (HARMONIZOME)
  message("Processing CMAP data set...")
  cmap_dm <- harmonizome_dtm(cmap_data)
  
  # LINCS data (HARMONIZOME)
  message("Processing LINCS L1000 data set...")
  lincs_dm <- harmonizome_dtm(lincs_data)
  
  # GEO PROFILES (HARMONIZOME)
  message("Processing GEO Small Molecules data set...")
  small_dm <- harmonizome_dtm(small_molecules)
  x <- grep("_homo", as.matrix(small_dm$drug_names))
  small_dm$matrix <- small_dm$matrix[x, ]
  small_dm$drug_names <- as.matrix(small_dm$drug_names)[x]
  
  # CTD drug matrix
  message("Processing CTD data set...")
  # load(ctd_data)
  ctd_drugs <- ctd_dtm(drug_df)
  
  # GSE85871: Natural products tested against MCF7 breast cancer cell line
  # load("/Volumes/HOME/scripts/r/conddr/supplementary_data/GSE85871_differential_expression_02132018.RData")
  message("Processing natural products data set...")
  # load(np_data)
  np_dm <- geo_matrix(geo_data = dge_matrix,
                      drug_names = unique(drug_info$drug_name),
                      gene_ids = colnames(dge_matrix))
  
  bowls <- list(cmap = cmap_dm,
                lincs = lincs_dm,
                small_molecules = small_dm,
                ctd = ctd_drugs,
                natural_products = np_dm)
  
  return(bowls)
  
}