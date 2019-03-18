#' Alchemy
#'
#'This function is a wrapper to the `cauldron` package. It will generate the TF-IDF matrices and cross-products that are used in DRUID. As of this version, the functions in `cauldron` are self-contained and take no input. This will change in future releases.
#'
#' @return A list of TF-IDF matrices and respective cross-product vectors.
alchemy <- function(add_new = NULL) {
  
  if (!is.null(add_new)) stop("Not ready for that yet.")
  
  message("--- Alchemy for DRUID ---")
  message("Get ingredient list...")
  shelves <- ingredient_list()
  
  message("Add ingredients...")
  bowls <- add_ingredients(cmap_data = shelves$cmap, 
                        small_molecules = shelves$small_molecules, 
                        ctd_data = shelves$ctd, 
                        lincs_data = shelves$lincs, 
                        np_data = shelves$natural_products)
  
  message("Mix the pot...")
  soup <- mix_pot(bowls)
  
  message("Write the menu...")
  menu_items <- menu(bowls)
  
  message("Pour recipe...")
  druid_potion <- pour_recipe(pot_contents = soup, menu_items = menu_items)
  
  save(file = "data/druid_potion.RData", druid_potion)
  # return(druid_potion)
}