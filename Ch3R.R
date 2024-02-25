die <- c(1,2,3,4,5,6)
die

is.vector(die)

five <- 5
five

length(five)
length(die)

int <- c(1L, 5L)
text <- c("ace", "hearts")

sum(num)
sum(text)

int <- c(-1L, 2L, 4L)
int
typeof(int)

sqrt(2)^2 - 2

# string number have the quotes " "

3>4 
logic <- c(TRUE, FALSE, TRUE)
logic
typeof(F)

comp <- c(1+ 1i, 1 + 2i, 1+ 3i)
typeof(comp)

raw(3)
  
flush <- c("ace", "spades", "hearts", "diamonds")

names(die) <- c("one", "two", "three", "four", "five", "six")
names(die)
attributes(die)
die

dim(die) <- c(2,3)
die
dim(die) <- c(1,2,3)
die

m <- matrix(die, nrow = 2, byrow = TRUE)
m

flush1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
matrix(flush1, nrow = 5)

now <- Sys.time()
now
typeof(now)
class(now)
unclass(now)

mil <- 1000000
mil
class(mil)

card <- c("ace", "heart", 1)
card

list1 <- list(100:130, "R", list(TRUE, FALSE))
list1

card <- list("ace", "heart", 1)
card

df <- data.frame(face = c("ace", "two", "six"), 
  suit = c("clubs", "clubs", "clubs"), value = c(1,2,3),
  stringsAsFactors = FALSE)
df

deck <- data.frame(
  face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
           "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
           "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
           "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
           "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine",
           "eight", "seven", "six", "five", "four", "three", "two", "ace"),
  suit = c("spades", "spades", "spades", "spades", "spades", "spades",
           "spades", "spades", "spades", "spades", "spades", "spades", "spades",
           "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
           "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts"),
  value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8,
            7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11,
            10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
)
write.csv(deck, file = "cards.csv", row.names = FALSE)
getwd()
