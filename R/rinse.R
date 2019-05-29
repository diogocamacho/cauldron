rinse <- function(bowl_list, menu) {
  
  # check for drugs that affect very little genes
  rinsed_bowl <- list()
  for (i in seq(1, length(bowl_list))) {
    a1 <- names(bowl_list)[i]
    a2 <- bowl_list[[i]]$matrix
    a3 <- menu[[which(names(menu) == a1)]]
    nix1 <- which(Matrix::rowSums(a2) < 3)
    if (length(nix1) != 0) {
      a2 <- a2[-nix1, ]
      a3 <- a3[-nix1, ]
    }
    
    # a hack...
    # remove drugs with no names
    b1 <- which(is.na(a3$name))
    if (length(b1) != 0) {
      a2 <- a2[-b1, ]
      a3 <- a3[-b1, ]
    }
    
    
    rinsed_bowl[[a1]] <- list(matrix = a2,
                              drugs = a3)
  }
  
  return(rinsed_bowl)
  
}