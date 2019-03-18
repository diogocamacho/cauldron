#' Pour recipe
#' 
#' This functions will put all the TF-IDF matrices together, as well as a combined TF-IDF will all data sources.
#' 
#' @param pot_contents TF-IDF and cross-product vector for drug matrices, as computed with the \link{\code{mix_pot}} function
#' @param menu_items Drugs metadata as obtained from the \link{\code{menu}} function
#' @return A named list with TF-IDF, cross-product vectors, and drug metadata for all of the data sources used.
pour_recipe <- function(pot_contents, menu_items) {

 cmap_data <- list(tfidf = pot_contents$cmap$tfidf,
                   cpm = pot_contents$cmap$cpm,
                   drugs = menu_items$cmap)
 
 lincs_data <- list(tfidf = pot_contents$lincs$tfidf,
                   cpm = pot_contents$lincs$cpm,
                   drugs = menu_items$lincs)
 
 natural_products_data <- list(tfidf = pot_contents$natural_products$tfidf,
                   cpm = pot_contents$natural_products$cpm,
                   drugs = menu_items$natural_products)
 
 small_molecules_data <- list(tfidf = pot_contents$small_molecules$tfidf,
                   cpm = pot_contents$small_molecules$cpm,
                   drugs = menu_items$small_molecules)
 
 ctd_data <- list(tfidf = pot_contents$ctd$tfidf,
                   cpm = pot_contents$ctd$cpm,
                   drugs = menu_items$ctd)
 
 potion <- list(cmap = cmap_data,
                lincs = lincs_data,
                small_molecules = small_molecules_data,
                natural_products = natural_products_data,
                ctd = ctd_data)
 
 return(potion)
}