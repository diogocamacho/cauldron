#' Chinese medicine natural products (GSE85871)
#' 
#' This data set was built based on the GSE85871 data set, where cell lines were treated with different compounds from traditional chinese medicine.
#' 
#' @format A named list comprised of:
#' \describe{
#'   \item TF-IDF matrix, which has 6,100 rows and 19,672 columns
#'   \item The crossproduct of the TF-IDF matrix, which is a vector with 6,100 elements
#'   \item A data frame with information about the drugs, with 7 columns:
#'     \item{id}{Drug ID from c-map}
#'     \item{name}{Common name of the drug}
#'     \item{concentration}{Concentration of the drug tested for a given profile, in uM}
#'     \item{duration}{Duration of drug exposure, in min}
#'     \item{cell_line}{Cell line where drug was tested}
#'     \item{vehicle}{Vehicle used in drug preparation}
#'     \item{vendor}{Drug vendor}
#' }
#' 
"GSE85871_natural_products"