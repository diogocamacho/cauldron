#' Drug menu
#' Builds the drug metadata data frame, from the data sets used to build the compendium.
#' 
#' @param ingredients Data frames and metadata for the drugs in each of the data sets to be combined.
#' @return A named list with all the drugs sets
menu <- function(ingredients) {

  # Data frame structure ----
  # all data frames will be of the type:
  # 1. id
  # 2. name
  # 3. concentration
  # 4. duration
  # 5. cell line
  # 6. vehicle
  # 7. vendor
  
  ### DRUG NAMES 
  # all drug names
  load("data/cmap_instances.RData")
  load("data/lincs_instances.RData")
  # cmap_drugs <- cmap_instances
  # lincs_drugs <- lincs_instances
  
  # lincs_drugs <- tibble::tibble(id = NA,
  #                               name = lincs_instances$name,
  #                               concentration = lincs_instances$concentration,
  #                               duration = lincs_instances$duration,
  #                               cell_line = lincs_instances$cell_line,
  #                               vehicle = NA,
  #                               vendor = NA)
  
  sm_drugs <- ingredients$small_molecules$drug_names
  sm_drugs <- tolower(sapply(sm_drugs, function(x) strsplit(x, "_")[[1]][1]))
  sm_drugs <- tibble::tibble(id = NA,
                             name = sm_drugs,
                             concentration = NA,
                             duration = NA,
                             cell_line = NA,
                             vehicle = NA,
                             vendor = NA)
  
  np_drugs <- tolower(ingredients$natural_products$drug_name)
  np_drugs <- tibble::tibble(id = NA,
                             name = np_drugs,
                             concentration = NA,
                             duration = NA,
                             cell_line = "MCF7",
                             vehicle = "DMSO",
                             vendor = NA)
  
  ctd_drugs <- tibble::tibble(id = NA,
                              name = as.vector(as.matrix(ingredients$ctd$drug_names)),
                              concentration = NA,
                              duration = NA,
                              cell_line = NA,
                              vehicle = NA,
                              vendor = NA)
  
  
  
  menu_items <- list(cmap = cmap_instances,
                     lincs = lincs_instances,
                     small_molecules = sm_drugs,
                     natural_products = np_drugs,
                     ctd = ctd_drugs)
  
  return(menu_items)
  
}