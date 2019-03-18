lincs_drugs <- lincs_drugs[[1]]
lincs_instances <- vector(mode = "list", length = length(lincs_drugs))
for (i in seq(1, length(lincs_drugs))) {
  a1 <- strsplit(lincs_drugs[i], "_")[[1]]
  lincs_instances[[i]] <- tibble(name = tolower(a1[2]),
                                 concentration = as.numeric(a1[6]),
                                 duration = as.numeric(a1[4]),
                                 cell_line = a1[3])
}
lincs_instances <- dplyr::bind_rows(lincs_instances)