#Chapter 8

play()
one_play()

attributes(DECK)
row.names(DECK) <- 101:152

levels(DECK) <- c("level 1", "level 2", "level 3")

attribute(one_play)

play <- function() {
  symbols <- get_symbols()
  prize <- score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}

play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}

slot_display <- function(prize){
  # extract symbols
  symbols <- attr(prize, "symbols")
  # collapse symbols into single string
  symbols <- paste(symbols, collapse = " ")
  # combine symbol with prize as a regular expression
  # \n is regular expression for new line (i.e. return or enter)
  string <- paste(symbols, prize, sep = "\n$")
  # display regular expression in console without quotes
  cat(string)
}

print.slots <- function(x, ...) {
  slot_display(x)
}

play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols, class = "slots")
}

methods(class =factor)


#Chapter 9 

die <- c(1, 2, 3, 4, 5, 6)
rolls <- expand.grid(die, die)
rolls$value <- rolls$Var1 + rolls$Var2
head(rolls, 3)

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
rolls$Var1
prob[rolls$Var1]

rolls$prob1 <- prob[rolls$Var1]
head(rolls, 3)
rolls$prob2 <- prob[rolls$Var2]
head(rolls, 3)
rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls, 3)
sum(rolls$value * rolls$prob)

combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)
}

prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06,
          "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]
head(combos, 3)

combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
head(combos, 3)
sum(combos$prob)
symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])

for (value in c("My", "first", "for", "loop")) {
  print("one run")
}
for (value in c("My", "second", "for", "loop")) {
  print(value)
}

chars <- vector(length = 4)
words <- c("My", "fourth", "for", "loop")
for (i in 1:4) {
  chars[i] <- words[i]
}

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
head(combos, 3)
sum(combos$prize * combos$prob)

score <- function(symbols) {
  diamonds <- sum(symbols == "DD")
  cherries <- sum(symbols == "C")
  # identify case
  # since diamonds are wild, only nondiamonds
  # matter for three of a kind and all bars
  slots <- symbols[symbols != "DD"]
  same <- length(unique(slots)) == 1
  bars <- slots %in% c("B", "BB", "BBB")
  # assign prize
  if (diamonds == 3) {
    prize <- 100
  } else if (same) {
    payouts <- c("7" = 80, "BBB" = 40, "BB" = 25,
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[slots[1]])
  } else if (all(bars)) {
    prize <- 5
  } else if (cherries > 0) {
    # diamonds count as cherries
    # so long as there is one real cherry
    prize <- c(0, 2, 5)[cherries + diamonds + 1]
  } else {
    prize <- 0
  }
  # double for each diamond
  prize * 2^diamonds
}

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
sum(combos$prize * combos$prob)

plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  while (cash > 0) {
    cash <- cash - 1 + play()
    n <- n + 1
  }
  n
}
plays_till_broke(100)

plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  repeat {
    cash <- cash - 1 + play()
    n <- n + 1
    if (cash <= 0) {
      break
    }
  }
  n
}
plays_till_broke(100)


#Chapter 10 

abs_loop <- function(vec){
  for (i in 1:length(vec)) {
    if (vec[i] < 0) {
      vec[i] <- -vec[i]
    }
  }
  vec
}
abs_sets <- function(vec){
  negs <- vec < 0
  vec[negs] <- vec[negs] * -1
  vec
}

system.time(abs(long))

vec[vec == "DD"]
## "DD"
vec[vec == "C"]
## "C"
vec[vec == "7"]
## "7"
vec[vec == "B"]
## "B"
vec[vec == "BB"]
## "BB"
vec[vec == "BBB"]
## "BBB"
vec[vec == "0"]
## "0"
vec[vec == "DD"] <- "joker"
vec[vec == "C"] <- "ace"
vec[vec == "7"] <- "king"
vec[vec == "B"] <- "queen"
vec[vec == "BB"] <- "jack"
vec[vec == "BBB"] <- "ten"
vec[vec == "0"] <- "nine"
change_vec <- function (vec) {
  vec[vec == "DD"] <- "joker"
  vec[vec == "C"] <- "ace"
  vec[vec == "7"] <- "king"
  vec[vec == "B"] <- "queen"
  vec[vec == "BB"] <- "jack"
  vec[vec == "BBB"] <- "ten"
  vec[vec == "0"] <- "nine"
  vec
}
system.time(change_vec(many))
change_vec2 <- function(vec){
  tb <- c("DD" = "joker", "C" = "ace", "7" = "king", "B" = "queen",
          "BB" = "jack", "BBB" = "ten", "0" = "nine")
  unname(tb[vec])
}
system.time(change_vec(many))

# symbols should be a matrix with a column for each slot machine window
score_many <- function(symbols) {
  # Step 1: Assign base prize based on cherries and diamonds ---------
  ## Count the number of cherries and diamonds in each combination
  cherries <- rowSums(symbols == "C")
  diamonds <- rowSums(symbols == "DD")
  ## Wild diamonds count as cherries
  prize <- c(0, 2, 5)[cherries + diamonds + 1]
  ## ...but not if there are zero real cherries
  ### (cherries is coerced to FALSE where cherries == 0)
  prize[!cherries] <- 0
  # Step 2: Change prize for combinations that contain three of a kind
  same <- symbols[, 1] == symbols[, 2] &
    symbols[, 2] == symbols[, 3]
  payoffs <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize[same] <- payoffs[symbols[same, 1]]
  # Step 3: Change prize for combinations that contain all bars ------
  bars <- symbols == "B" | symbols == "BB" | symbols == "BBB"
  all_bars <- bars[, 1] & bars[, 2] & bars[, 3] & !same
  prize[all_bars] <- 5
  # Step 4: Handle wilds ---------------------------------------------
  ## combos with two diamonds
  two_wilds <- diamonds == 2
  ### Identify the nonwild symbol
  one <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 2] == symbols[, 3]
  two <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 1] == symbols[, 3]
  three <- two_wilds & symbols[, 1] == symbols[, 2] &
    symbols[, 2] != symbols[, 3]
  ### Treat as three of a kind
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]
  ## combos with one wild
  one_wild <- diamonds == 1
  ### Treat as all bars (if appropriate)
  wild_bars <- one_wild & (rowSums(bars) == 2)
  prize[wild_bars] <- 5
  ### Treat as three of a kind (if appropriate)
  one <- one_wild & symbols[, 1] == symbols[, 2]
  two <- one_wild & symbols[, 2] == symbols[, 3]
  three <- one_wild & symbols[, 3] == symbols[, 1]
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]
  # Step 5: Double prize for every diamond in combo ------------------
  unname(prize * 2^diamonds)
}
system.time(play_many(10000000))
## user system elapsed
## 20.942 1.433 22.367

