library(foreign)  # Allows us to read spss files!
library(corrplot)
library(car)
library(QuantPsyc)
library(leaps)
library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(DescTools) #VIF Function
library(leaps) #Best Set Linear Regression Functions
library(REdaS) #Bartlett's Test of Sphericity
library(psych) #PCA/FA functions
library(factoextra) #PCA Visualizations
library("FactoMineR") #PCA functions
library(ade4) #PCA Visualizations
#########################################################
#Set Working Directory
setwd("~/Dsc-324/assigment-2-dsc324")
training_values <- read.csv(file="ECR data.csv", header=TRUE, sep=",")
dim(training_values)
head(training_values)
sum(is.na(training_values))
str(training_values)
#Test KMO Sampling Adequacy
KMO(training_values)

training_p = prcomp(training_values, center=T, scale=T)
training_p

#Check Scree Plot
plot(training_p)
abline(1, 0)
training_p2 = psych::principal(training_values, rotate="varimax", nfactors=5, scores=TRUE)
training_p2
print(training_p2$loadings, cutoff=.4, sort=T)
training_p2$values
training_p2$communality
training_p2$rot.mat
scores <- training_p2$scores
scores_1 <- scores[,1]
summary(scores_1)
scores_2 <- scores[,2]
summary(scores_2)
scores_3 <- scores[,3]
summary(scores_3)
scores_4 <- scores[,4]
summary(scores_4)
scores_5 <- scores[,5]
summary(scores_5)

training_fit = factanal(training_values, 5)
print(training_fit$loadings, cutoff=.2, sort=T)
summary(training_fit)

