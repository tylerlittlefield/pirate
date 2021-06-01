random_quote <- function() {
  rows <- nrow(schrute::theoffice)
  random <- schrute::theoffice[sample(1:rows, 1), ]
  random[] <- lapply(random, as.character)
  as.list(random)
}
