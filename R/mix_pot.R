#' Mix the pot
#' This function will calculate the TF-IDF matrix and its cross-product for each of the drug compendia added. The TF-IDF will be calculated using the \link{\code{ctfidf}} function and the cross-product with the \link{\code{crossprod_matrix}} function.  The TF-IDF and its cross-product will be determined independently for each data set.
#' 
#' @param bowl_list A list of data sets (compendia), from the \link{\code{add_ingredients}} function.
#' @return A TF-IDF data matrix and a crossproduct vector for each of the data sets.
# COMBINE DRUG MATRICES
mix_pot <- function(bowl_list) {
  message("Computing tf-idf matrix...")
  res <- vector(mode = "list", length = length(bowl_list))
  names(res) <- names(bowl_list)
  for(i in seq(1, length(bowl_list))) {
    message(paste("Data source:", names(bowl_list)[i]))
    a1 <- ctfidf(bowl_list[[i]]$matrix)
    a2 <- crossprod_matrix(a1)
    res[[i]] <- list(tfidf = a1, 
                     cpm = a2)
  }
  return(res)
}