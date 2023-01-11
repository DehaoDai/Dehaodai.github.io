####################################################################
# Week 1: R tutorial Math 181E
# Originally prepared for 181A by Jingwen Liang
# Updated for 181E by Dehao Dai
####################################################################

#=========================
# OVERVIEW
#=========================

# What is R
# R is a language and environment for statistical computing and graphics. 
# Uses:
# 1. Data Modeling
# 2. Data Visualization

# Plenty of functions in different packages for statistical work and applications

# R is a free statistical software, 
# Download instructions can be found at:
# https://www.r-project.org/

# It can be downloaded from one of the mirror sites in 
# http://cran.r-project.org/mirrors.html.
# You should pick your nearest location.

#After R is started, there is a console awaiting for input. 
#At the prompt (>), you can enter numbers and perform calculations.


###################################################################
#=========================
# BASIC INTRODUCTION 
#=========================

#R can be used as a calculator
12 + 9
17.1* 13
554 /3

# Variable Assignment
# We assign values to variables with the assignment operator "<-"/"=". 
x<-1
x

# Difference between "<-" and "="
# Use <- for variable assignment
# Use = for parameter assignment in function

# R functions are invoked by its name, 
# then followed by the parenthesis, and zero or more arguments. 
# The following apply the function c to combine three numeric values into a vector.
c(1, 2, 3) 

# Comments
# All text after the pound sign "#" within the same line is considered a comment.
1 + 1      # this is a comment 

# Extension Package
# Sometimes we need additional functionality beyond those offered by the core R library. 
# In order to install an extension package, 
# you should invoke the install.packages function at the prompt and follow the instruction.
install.packages("ggplot2") # you should pick your nearest location
# when you use the package, invoke the package by commond
library(ggplot2)

#getting help
help(c)
?c #open a documentation of the function c in R. 

??combine # returns list of functions installed on your computer related to combine
#?? only looks for functions already installed on your computer.

#also you can always google.

###################################################################

#=========================
# TYPES OF DATA-1
#=========================

# There are 5 basic data types in R: numeric, integer, complex, logical, and character.
basic.data1 <- 1.5     # assign value 1.5 to variable "basic.data1"
class(basic.data1)	# returns the type of basic.data1
is.numeric(basic.data1)	# returns whether basic.data1 is numeric
is.integer(basic.data1)	# returns whether basic.data1 is integer

basic.data2 <- 3
class(basic.data2)	# notice the return type of basic.data2
basic.data2 <- as.integer(basic.data2)	# now basic.data2 is of type integer
as.integer(3.5)	# if a non-integer is provided...

# NOTE: COMPARE WITH round(3.5)

basic.data4 <- TRUE
basic.data4 <- FALSE
basic.data4 <- 3 > 4	# this returns FALSE
basic.data4 & TRUE	# and
basic.data4 | TRUE	# or
!basic.data4	# negation

basic.data5 <- "character"
basic.data5

#=========================
# TYPES OF DATA-2
#=========================

# Beyond basic data types, there are also more advanced ones: vector, matrix, list, and data frame.
# Advanced => not just single values but combinations

------------
# 1. VECTOR
------------
  
# A vector is a sequence of data elements of the same basic type.
c(1,2,3)  #a vector of numeric values
c(TRUE,FALSE,TRUE) # a vector of logical values

# WHAT IS THE OUTPUT HERE?
a1 <- TRUE
# class(a1)

v1<-c(1,2,3) #assign vector to variable v1
length(v1)   #length of vector v1

#Vectors can be combined via the function c. 
#For examples, the following two vectors n and s are combined into a new vector 
#containing elements from both vectors.
n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
v2 <- c(n, s) 

# if two vector has different data type, one of them will be coerced into another 
# to keep the same primitive data type for members in the same vector 

# WHAT IS THE OUTPUT HERE?
a2 <- c(TRUE,FALSE)
a3 <- c(n, a2)
# class(a3)

# WHAT IS THE CLASS OF v2 ABOVE?

v2
v2[1] #return the first element in x
v2[length(v2)] #return the last element in x
v2[-1]  #remove the first element from vector v2

# Can use seq command to form vectors
seq(from=0, to=100, by=10)

# Operations on vectors
sum(n)
mean(n)
sd(n)

------------
  # 3. MATRIX
  ------------
  
  A <- matrix( 
    c(2, 4, 3, 1, 5, 7), # the data elements 
    nrow=2,              # number of rows 
    ncol=3,              # number of columns 
    byrow = TRUE)        # fill matrix by rows 

# TRY bycol=TRUE

A[2, 3]      # element at 2nd row, 3rd column 
A[2, ]       # the 2nd row 
A[ ,3]       # the 3rd column
A[ ,c(1,3)]  # the 1st and 3rd columns 
t(A)         # transpose of A

B <- matrix(
  c(1,6),
  nrow=2,
)
cbind(A,B) # combine the columns of A and B with cbind.

C <- matrix(
  c(1,3,5),
  nrow=1)
rbind(A,C) # combine the rows of A and C with cbind.

# Ensure compatibility for concatenations

D <- matrix(1:9,nrow=3)
E <- matrix(9:1,nrow=3)

# WHAT DOES THIS OUTPUT?
E <- matrix(9:1,nrow=3,byrow=TRUE)

# Matrix operations
# Ensure compatibility for multiplications and additions
H<- D * E; H #elements wise
K <- D %*% E; H #the real matrix multiplication

eigen(E)

---------------------------
  # 4. LISTS AND DATA FRAMES
  ---------------------------
  
  # Try ?data.frame and ?list
  ?data.frame

# Some examples
# List
a <- list(c(1, "a"))
a
class(a)
# compare without list using class(a)

# Data frame
df<-data.frame(
  Name=c("Alice", "Becka", "James", "Jeffrey", "John"),
  Sex=c("F", "F", "M", "M", "M"),
  Age=c(13, 13, 12, 13, 12),
  Height=c(56.5, 65.3, 57.3, 62.5, 59.0),
  Weight=c(84.0, 98.0, 83.0, 84.0, 99.5)
); 
df
class(df)

x <- 1:4
y <- c("a","b")
z <- data.frame(x,y)
class(x)
class(y)
class(z)
z

z1 <- list(x,y)
z1[[1]]
z1[[2]]

# data frame versus list
# data frame is list of vectors of equal length

# data frame versus matrix
# different data types uses data frame
# else
# memory efficiency, linear algebra - matrix
# referencing by columns - data frame

# Use matrix for calculations, format out as data frame for referencing
# data.frame, data.matrix are some conversion commands

###################################################################

#=========================
# DIRECTORY MANIPULATION
#=========================

# List variables
ls()

# Clear workspace variables
rm(list=ls())

###################################################################

#=========================
# IMPORTING DATA
#=========================

# R offers plenty of options for loading external data, including Excel, Minitab and SPSS files.
# We have included a tutorial titled Data Import on the subject for the purpose
# http://www.r-tutor.com/r-introduction/data-frame/data-import

# Common function: read.table

############################################
# Example 1 ("Population": 1 column data)
############################################

dat1 <- read.table("USpop.dat")
summary(dat1)
nrow(dat1)
colnames(dat1)
head(dat1)
tail(dat1)

#change column names
colnames(dat1)

names(dat1)[1] <- "popsize"
colnames(dat1)

############################################
# Example 2 ("West starts": 2 column data)
############################################

dat2 <- read.table("Wstarts.b1")
summary(dat2)
nrow(dat2)
colnames(dat2)
head(dat2)
tail(dat2)

#change column names
colnames(dat2)

names(dat2)[1] <- "a"
names(dat2)[2] <- "b"

colnames(dat2)

############################################
# Example 3 ("Stanford data")
############################################

dat <- read.table("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/zip.digits/train.4", sep=",")
class(dat)
# this is a data frame

nrow(dat)
colnames(dat)

#change colume names

names(dat)[1] <- "X1" # foreign exchange rate
names(dat)[2] <- "X2" # stock index
names(dat)[3] <- "X3" # stock price
colnames(dat)

plot(dat$X1, type = 'l')
plot(-dat$X1, type = 'l')
# plot(dat$X2[1:2000], type = 'l')
# plot(dat$X3[1:2000], type = 'l')

#=========================
# EXPORTING DATA
#=========================

y <- 1:10
write(y, file="try.txt")

# Note: Various options are available with write
# Please do ?write


#################################################################

#=========================
# FUNCTION EXAMPLE
#=========================

# Write a function
fx <- function(x){
  y <- x^2-1
  return(y)
}

z1 <- fx(1)
z2 <- fx(2)


#=========================
# OPERATORS
#=========================

# Arithmetic
# +, -, *, ?, ^, %%
# Comparison
# <, >, <=, >=, !=, ==
# Logical
# &, | , &&, ||, !

#=========================
# CONTROL STRUCTURES
#=========================

# if
a <- 33
b <- 200

if (b > a) {
  print("b is greater than a")
}

##Else if
a <- 33
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print ("a and b are equal")
}

##Else
a <- 200
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}



# for
##A for loop is used for iterating over a sequence:
for (x in 1:10) {
    print(x)
}  

##Print every item in a list:
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  print(x)
}

##Print the number of dices:
dice <- c(1, 2, 3, 4, 5, 6)

for (x in dice) {
  print(x)
}

#Break
##With the break statement, we can stop the loop before it has looped through all the items:
##Stop the loop at "cherry":
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "cherry") {
    break
  }
  print(x)
}

# while
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}

i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}