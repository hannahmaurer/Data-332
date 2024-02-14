6+2
[1] 8
> 8*3
[1] 24
> 24-6
[1] 18
> 18/3
[1] 6
> die<- 1:6
> a<- 1
> die-1
[1] 0 1 2 3 4 5
> die/2
[1] 0.5 1.0 1.5 2.0 2.5 3.0
> die*die
[1]  1  4  9 16 25 36
> 1:2
[1] 1 2
> die + 1:2
[1] 2 4 4 6 6 8
> die + 1:4
[1] 2 4 6 8 6 8
Warning message:
  In die + 1:4 :
  longer object length is not a multiple of shorter object length
> round(3.1415)
[1] 3
> factoral(3)
Error in factoral(3) : could not find function "factoral"
> factorial(3)
[1] 6
> mean (1:6)
[1] 3.5
> mean(die)
[1] 3.5
> round(mean(die))
[1] 4
> sample(x=die, size=1)
[1] 5
> arggs(round)
Error in arggs(round) : could not find function "arggs"
> sample(die,1)
[1] 2
> sample(die,2)
[1] 3 1
> sample(die, size=2, replace = TRUE)
[1] 5 2
> dice
Error: object 'dice' not found
> dice<-sample(die,size=2,replace=TRUE)
> dice
[1] 6 6
> sum(dice)
[1] 12
> roll()
Error in roll() : could not find function "roll"
> roll<-dice
> roll
[1] 6 6
> my_function() {}
Error: unexpected '{' in "my_function() {"
> my_function() {}
Error: unexpected '{' in "my_function() {"
> my_function<-function() {}
> roll<-function() {}
> roll<-function() {
  +     die<-1:6
  +     dice<-sample(die,size=2,replace=TRUE)
  +     sum(dice)
  + }
> roll()
[1] 7
> roll2<-function(bones) {
  +     dice<-sample(bones,size=2,replace=TRUE)
  +     sum(dice)
  + }
> roll2()
Error in roll2() : argument "bones" is missing, with no default
> roll2(bones=1:4)
[1] 6