deal(deck)

head(deck)
deck[c(1, 1), c(1, 2, 3)]

vec <- c(6,1,3,6,10,5)

deck[1, c(TRUE, TRUE, FALSE)]

deal <- function(cards) {
  cards[1, ]
}

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))