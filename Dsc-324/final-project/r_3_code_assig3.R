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
setwd("~/Dsc-324/final-project")
training_values <- read.csv(file="Train.csv", header=TRUE, sep=",")

test_values <- read.csv(file="Test.csv", header=TRUE, sep=",")
dim(training_values)
dim(test_values)
head(training_values)
head(test_values)

library(psych)


#Create new subsets of data

test_values2 <- test_values[,c(2:21)]
str(test_values2)

training_datasets <- merge(test_values2, training_values, by = c("battery_power"))
dim(training_datasets)
head(training_datasets)
sum(is.na(training_datasets))
library(psych)
describe(training_datasets)
str(training_datasets)
names(training_datasets)
training_datasets2 <- training_datasets[,c(1,3,7:9,11:17,22,26:36)]
str(training_datasets2)

PCA_Plot = function(pcaData)
{
  library(ggplot2)
  
  theta = seq(0,2*pi,length.out = 100)
  circle = data.frame(x = cos(theta), y = sin(theta))
  p = ggplot(circle,aes(x,y)) + geom_path()
  
  loadings = data.frame(pcaData$rotation, .names = row.names(pcaData$rotation))
  p + geom_text(data=loadings, mapping=aes(x = PC1, y = PC2, label = .names, colour = .names, fontface="bold")) +
    coord_fixed(ratio=1) + labs(x = "PC1", y = "PC2")
}

PCA_Plot_Secondary = function(pcaData)
{
  library(ggplot2)
  
  theta = seq(0,2*pi,length.out = 100)
  circle = data.frame(x = cos(theta), y = sin(theta))
  p = ggplot(circle,aes(x,y)) + geom_path()
  
  loadings = data.frame(pcaData$rotation, .names = row.names(pcaData$rotation))
  p + geom_text(data=loadings, mapping=aes(x = PC3, y = PC4, label = .names, colour = .names, fontface="bold")) +
    coord_fixed(ratio=1) + labs(x = "PC3", y = "PC4")
}

PCA_Plot_Psyc = function(pcaData)
{
  library(ggplot2)
  
  theta = seq(0,2*pi,length.out = 100)
  circle = data.frame(x = cos(theta), y = sin(theta))
  p = ggplot(circle,aes(x,y)) + geom_path()
  
  loadings = as.data.frame(unclass(pcaData$loadings))
  s = rep(0, ncol(loadings))
  for (i in 1:ncol(loadings))
  {
    s[i] = 0
    for (j in 1:nrow(loadings))
      s[i] = s[i] + loadings[j, i]^2
    s[i] = sqrt(s[i])
  }
  
  for (i in 1:ncol(loadings))
    loadings[, i] = loadings[, i] / s[i]
  
  loadings$.names = row.names(loadings)
  
  p + geom_text(data=loadings, mapping=aes(x = PC1, y = PC2, label = .names, colour = .names, fontface="bold")) +
    coord_fixed(ratio=1) + labs(x = "PC1", y = "PC2")
}

PCA_Plot_Psyc_Secondary = function(pcaData)
{
  library(ggplot2)
  
  theta = seq(0,2*pi,length.out = 100)
  circle = data.frame(x = cos(theta), y = sin(theta))
  p = ggplot(circle,aes(x,y)) + geom_path()
  
  loadings = as.data.frame(unclass(pcaData$loadings))
  s = rep(0, ncol(loadings))
  for (i in 1:ncol(loadings))
  {
    s[i] = 0
    for (j in 1:nrow(loadings))
      s[i] = s[i] + loadings[j, i]^2
    s[i] = sqrt(s[i])
  }
  
  for (i in 1:ncol(loadings))
    loadings[, i] = loadings[, i] / s[i]
  
  loadings$.names = row.names(loadings)
  
  print(loadings)
  p + geom_text(data=loadings, mapping=aes(x = PC3, y = PC4, label = .names, colour = .names, fontface="bold")) +
    coord_fixed(ratio=1) + labs(x = "PC3", y = "PC4")
}
training_p = prcomp(training_datasets2, center=T, scale=T)
training_p
summary(training_p)
plot(training_p)
abline(1, 0)
library(psych)

training_p2 = psych::principal(training_datasets2, rotate="varimax", nfactors=2, scores=TRUE)
training_p2
print(training_p2$loadings, cutoff=.1, sort=T)
names(training_datasets2)
training_datasets3 <- training_datasets2[,c(2:4,6:12,16:24)]
KMO(training_datasets3)
#Overall MSA =  0.51

#Test Bartlett's Test of Sphericity
library(REdaS)
bart_spher(training_datasets3)
#p-value < 2.22e-16 (Very Small Number)
str(training_datasets3)
names(training_datasets3)
training_p3 = psych::principal(training_datasets3, rotate="varimax", nfactors=2, scores=TRUE)
training_p3
print(training_p3$loadings, cutoff=.1, sort=T)



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
scores_6 <- scores[,6]
summary(scores_6)
scores_7 <- scores[,7]
summary(scores_7)





