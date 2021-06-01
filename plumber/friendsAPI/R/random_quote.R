random_quote <- function() {
  rows <- nrow(friends::friends)
  random <- friends::friends[sample(1:rows, 1), ]
  random[] <- lapply(random, as.character)
  as.list(random)
}
