#' Drug menu
#' Builds the drug metadata data frame, from the data sets used to build the compendium.
#' 
#' @param ingredients Data frames and metadata for the drugs in each of the data sets to be compbined.
#' @return A named list with all the drugs sets
menu <- function(ingredients) {

  ### DRUG NAMES 
  # all drug names
  load(cmap_instances)
  load(lincs_instances)
  cmap_drugs <- cmap_instances
  lincs_drugs <- lincs_instances
  
  sm_drugs <- ingredients$small_molecules$drug_names
  sm_drugs <- tolower(sapply(sm_drugs, function(x) strsplit(x, "_")[[1]][1]))
  
  np_drugs <- tolower(ingredients$natural_products$drug_name)
  np_drugs <- tibble(name = np_drugs,
                     cell_line = "MCF7",
                     vehicle = "DMSO")
  
  ctd_drugs <- ingredients$ctd$drug_names
  
  menu_items <- list(cmap = cmap_instances,
                     lincs = lincs_instances,
                     small_molecules = sm_drugs,
                     natural_products = np_drugs,
                     ctd = ctd_drugs)
  
  return(menu_items)
  
}