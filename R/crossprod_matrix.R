#' Cross-product vector for the TF-IDF
#'
#' Returns the cross-product for an input TF-IDF matrix
#'
#' @param tfidf_matrix Sparse TF-IDF matrix
#' @return cross-product of the TF-IDF matrix
crossprod_matrix <- function(tfidf_matrix) {
  cpm <- apply(tfidf_matrix, 1, crossprod) # <-- crossproduct matrix for tfidf
  return(cpm)
}