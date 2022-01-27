##---------------------------------------------------------------
#------------- Solution- 2-------------------------------------
#-------------A-----------------------------
v= matrix(c(-4,1,7),nrow = 3,ncol = 1)
v
w= matrix(c(0,4,20),nrow = 3,ncol = 1)
w
scalar=t(v)%*%w
scalar
#---------------B-------------------------
w= matrix(c(0,4,20),nrow = 3,ncol = 1)
w
ans_b=-3*w
ans_b
#-------------C----------------------------
M= matrix(c(8,3,0,21,42,3,0,34,11),nrow = 3,ncol = 3,byrow = T)
M
ans_c=M%*%v
ans_c
#----------------D------------------------
N= matrix(c(-6,-3,0,0,2,7,5,1,-8),nrow = 3,ncol = 3,byrow = T)
N
ans_d=M+N
ans_d
#---------------E-----------------------
ans_e=M-N
ans_e
#-------------F----------------------------
Z= matrix(c(1,-1,1,6,1,-2,1,0),nrow = 4,ncol = 2,byrow = T)
Z
ans_f=t(Z)%*%Z
ans_f
#--------------G------------------------
ans_g=solve(ans_f)
ans_g
#------------------H-----------------------
Y= matrix(c(0,9,0,1),nrow = 4,ncol = 1,byrow = T)
Y
ans_h=t(Z)%*%Y
ans_h
#----------------------I-----------------
B= ans_g%*%ans_h
B
#------------------J-------------------
ans_j=det(ans_f)
ans_j
##---------------------------------------------------------------
#------------- Solution- 5-------------------------------------

library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(DescTools) #VIF Function
library(leaps) #Best Set Linear Regression Functions
#set a dataset form file
setwd("~/Dsc-324")
training_values <- read.csv(file="insurance_dataset.csv", header=TRUE, sep=",")
#look a size of dataset by row and col
dim(training_values)
# look a data is  a num or category 
str(training_values)
# Show names of the variables in datasets
names(training_values)
# looking a datasets table /Show for first 6 rows of data
head(training_values)
# Check for Missing Values 
sum(is.na(training_values))
#Create new subsets of data
library(psych)
training_dataset2 <- training_values[,c(1,3:5,7,9,10)]
str(training_dataset2)
head(training_dataset2)
library(corrplot) #Plot Correlations
library(ggplot2)
#library(dplyr)

#Check for Multicollinearity with Correlations
training_cor<-cor(training_dataset2, method="spearman")
training_cor
corrplot(training_cor, method = "circle")
model1 <- lm( expenses~ ., data=training_dataset2)
model1
library(DescTools)
VIF(model1)
#Creating Automatic Models
library(leaps)
null = lm( expenses~ 1, data=training_dataset2)
null
full = lm(expenses ~ ., data=training_dataset2)
full
#Forward Regression
train_Forward = step(null, scope = list(lower=null, upper=full), direction="forward")
summary(train_Forward)
#Backward Regression
train_Backward = step(full, direction="backward")
summary(train_Backward)
#Stepwise Regression
train_Step = step(null, scope = list(upper=full), direction="both")
summary(train_Step)
#Boxplots
boxplot(training_dataset2$expenses, col = "blue", main="expenses", 
        ylab="expenses" )
summary(training_dataset2$expenses)

#GG Boxplot
ggboxplot<-ggplot(training_dataset2, aes(y=expenses)) +
  geom_boxplot(col="blue") +
  labs(
    title="expenses",
    y="expenses(100K)")
ggboxplot








