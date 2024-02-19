install.packages("ggplot2")
library("ggplot2")
qplot
x<-c(-1, -0.8, -0.6, -0.4, -0.2)
y<- x^3
qplot(x, y)
x2 <- c(1,1,1,1,1,2,2,2,2,2,3,3,4)
qplot(x2, binwidth = 1)
x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)
replicate(3, 1+1)
replicate(10, roll())
roll <- function() { 
  +     die <- 1:6 
  +     dice <- sample(die, size = 2, replace = TRUE)
  +     sum(dice)
  + }
> replicate(10, roll())
[1] 7 3 9 8 2 9 6 9 6 7
> rolls <- replicate(10000, roll())
> qplot(rolls, binwidth = 1)
> roll <- function() {
  +     die <- 1:6
  +     dice <- sample(die, size = 2, replace + TRUE,
                       +                    prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  +     sum(dice)
  + }
> qplot(rolls, binwidth = 1)