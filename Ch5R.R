vec <- c(0, 0, 0, 0, 0, 0)
vec[1]
vec[1] <- 1000
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec[4:6] <- vec[4:6] + 1

vec[c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)]
1 > 2
1 > c(0, 1, 2)
c(1, 2, 3) == c(3, 2, 1)

1 %in% c(3, 4, 5)
c(1, 2) %in% c(3, 4, 5)
c(1, 2, 3) %in% c(3, 4, 5)
c(1, 2, 3, 4) %in% c(3, 4, 5)

deck2$face
deck2$face == "ace"
sum(deck2$face == "ace")
deck3$face == "ace"
deck3$value[deck3$face == "ace"]
deck3$value[deck3$face == "ace"] <- 14
head(deck3)

deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"] <- 1
deck4$value[deck4$suit == "hearts"]
deck4[deck4$face == "queen", ]
deck4[deck4$suit == "spades", ]

w > 0
10 < x & x < 20
y == "February"
all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
             "Saturday", "Sunday"))

facecard <- deck5$face %in% c("king", "queen", "jack")

c(NA, 1:50)
mean(c(NA, 1:50))
mean(c(NA, 1:50), na.rm = TRUE)
NA == NA
c(1, 2, 3, NA) == NA
is.na(NA)
vec <- c(1, 2, 3, NA)
is.na(vec)

deck5$value[deck5$face == "ace"] <- NA