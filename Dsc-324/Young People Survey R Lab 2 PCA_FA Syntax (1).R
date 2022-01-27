ta#Author:  Stephanie Besser
#Date:  April 17, 2019

#Lab 2:  Principal Component Analysis (PCA) and Factor Analysis in R

#Using Young People Survey Datasets

#Note: Run Shortcut:  CTRL+Enter

#Libraries
library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(REdaS) #Bartlett's Test of Sphericity
library(psych) #PCA/FA functions
library(factoextra) #PCA Visualizations
library("FactoMineR") #PCA functions
library(ade4) #PCA Visualizations
library(foreign)
library(CCA)
library(yacca)
library(MASS)
##############################################################################################

#Set Working Directory
setwd("~/Dsc-324/final-project")


#Read in Datasets

responses <- read.csv(file="responses (1).csv", header=TRUE, sep=",")

#Check Sample Size and Number of Variables
dim(responses)
#1,010-Sample Size and 150 variables

#Show for first 6 rows of data
head(responses)

names(responses)

################################################################################################

#Check for Missing Values (i.e. NAs)

#For All Variables
sum(is.na(responses))
#571 total missing values (571 cells with missing data)


#Treat Missing Values

#Listwise Deletion
responses2 <- na.omit(responses)

#Check new data has no missing data
sum(is.na(responses2))


#################################################################################################################

#Show Structure of Dataset
str(responses2, list.len=ncol(responses2))

#Show column Numbers
names(responses2)

#Categorical Variables (Var_num):  Smoking (74), Alcohol (75), Punctuality (108), Lying (109), Internet.usuage (133), Gender (145), 
#                         Left...right.handed (146), Education (147), Only.child(148), Village.town (149), House...block.of.flats (150)


#Create new subsets of data (Numeric Variables Only)

responses3 <- responses2[,c(1:73,76,77:107,110:132,134:140,141:144)]

music <- responses2[,1:19]
#movie <- responses2[,20:31]
#hobbies_interests <- responses2[,32:63]
#phobias <- responses2[,64:73]
#health <- responses2[,76]
#personality_views_opinions <- responses2[,c(77:107,110:132)]
spending <- responses2[,134:140]
#demographics <- responses2[,141:144]
##############################################################################
###############################################################################
ccaWilks = function(set1, set2, cca)
{
  ev = ((1 - cca$cor^2))
  ev
  
  n = dim(set1)[1]
  p = length(set1)
  q = length(set2)
  k = min(p, q)
  m = n - 3/2 - (p + q)/2
  m
  
  w = rev(cumprod(rev(ev)))
  
  # initialize
  d1 = d2 = f = vector("numeric", k)
  
  for (i in 1:k) 
  {
    s = sqrt((p^2 * q^2 - 4)/(p^2 + q^2 - 5))
    si = 1/s
    d1[i] = p * q
    d2[i] = m * s - p * q/2 + 1
    r = (1 - w[i]^si)/w[i]^si
    f[i] = r * d2[i]/d1[i]
    p = p - 1
    q = q - 1
  }
  
  pv = pf(f, d1, d2, lower.tail = FALSE)
  dmat = cbind(WilksL = w, F = f, df1 = d1, df2 = d2, p = pv)
}
music
spending


c = cancor(spending,music)
c

library(CCA)

matcor(music,spending )


cc_mm = cc(music,spending )
cc_mm$cor
wilks_mm = ccaWilks(music,spending, cc_mm)
round(wilks_mm, 2)

library(yacca)
c2 = cca(music,spending)
summary(c2)



#####################################################################################
##########################################################################################


#Show descriptive statistics

#Normality Rule of Thumb with Skewnewss and Kurtosis (think normal bell curve):
#Short Way:
#If skewnewss is close to 0, the distribution is normal.
#If Kurtosis is -3 or 3, the distribution is normal.

#If skewness is less than -1 or greater than 1, the distribution is highly skewed.
#If skewness is between -1 and -0.5 or between 0.5 and 1, the distribution is moderately skewed.
#If skewness is between -0.5 and 0.5, the distribution is approximately symmetric.


library(psych)
describe(music)
#describe(movie)
#describe(hobbies_interests)
#describe(phobias)
#describe(health)
#describe(personality_views_opinions)
describe(spending)
#describe(demographics)



#############################################################################################################

#Exploratory Analysis Graphing

#In order to use the graphing functions, you need to chunk the data into smaller subsets of data.

#GGpairs
p1 <- ggpairs(personality_views_opinions[,1:5])
p1

#Note: Does not show boxplots or bar charts, because there is no categorical variable in the personality_views_opinions dataset

# To save the ggplot as png
ggsave("p1.png")

#Boxplots
boxplot(personality_views_opinions[,1:5],data=personality_views_opinions, main="Personality Traits, Views, and Opinions", xlab="Personality", col = c("blue","green"))


#Check for Multicollinearity with Correlations


M<-cor(personality_views_opinions, method="spearman")
M

#personality
corrplot(cor(M,method="spearman"), method = "number", type = "lower")
#High Correlations: God, Final Judgement, Number.of.friends, and Loneliness

#GGplot Correlation
ggcorr(personality_views_opinions[,1:20], method = c("pairwise","spearman"), label=TRUE)

ggcorr(personality_views_opinions, method = c("pairwise","spearman"))

# Run a correlation test to see how correlated the variables are.  Which correlations are significant
options("scipen"=100, "digits"=5)
round(cor(personality_views_opinions), 2)
MCorrTest = corr.test(personality_views_opinions, adjust="none")
MCorrTest

M = MCorrTest$p
M

# Now, for each element, see if it is < .01 (or whatever significance) and set the entry to 
# true = significant or false
MTest = ifelse(M < .01, T, F)
MTest

# Now lets see how many significant correlations there are for each variable.  We can do
# this by summing the columns of the matrix
colSums(MTest) - 1  # We have to subtract 1 for the diagonal elements (self-correlation)

#################################################################################################################
#########################################################################
# PCA_Plot functions
#########################################################################

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

##################################################
#PCA/FA
##################################################

#Test KMO Sampling Adequacy

library(psych)
KMO(personality_views_opinions)
#Overall MSA =  0.76

#Test Bartlett's Test of Sphericity
library(REdaS)
bart_spher(personality_views_opinions)
#p-value < 2.22e-16 (Very Small Number)


#Test for Reliability Analysis using Cronbach's Alpha
library(psych)
alpha(personality_views_opinions,check.keys=TRUE)
#raw_alpha = 0.68
#######################################################
#Parallel Analysis (Horn's parallel analysis)

#Created a Psychologist John L. Horn in 1965

#Closest to Heuristic Determination of Number of Components or Factors

#Compares actual eigenvalues with ones from a Monto-Carolo simulated dataset of
#the same size

#Dependent upon sample size, correlation coefficient, and how items fall on 
#components

library(psych)

comp <- fa.parallel(personality_views_opinions)
comp

#######################################################
#Create PCA
p = prcomp(personality_views_opinions, center=T, scale=T)
p

#Check Scree Plot
plot(p)
abline(1, 0)

#Check PCA Summary Information
summary(p)
print(p)

########################################################

#Check PCA visualizations
plot(p) #Scree Plot
PCA_Plot(p) #PCA_plot1
PCA_Plot_Secondary(p) #PCA_Plot2
biplot(p) #Biplot

#########################################################


#Calculating the Varimax Rotation Loadings manually
rawLoadings = p$rotation %*% diag(p$sdev, nrow(p$rotation), nrow(p$rotation))
print(rawLoadings)
v = varimax(rawLoadings)

#Options available under varimax function
ls(v)
v

#########################################################

# The Psych package has a wonderful PCA function that allows many more options
# including build-in factor rotation, specifiying a number of factors to include 
# and automatic "score" generation

#Best Way to Conduct PCA Analysis

p2 = psych::principal(personality_views_opinions, rotate="varimax", nfactors=6, scores=TRUE)
p2
print(p2$loadings, cutoff=.4, sort=T)

#PCAs Other Available Information

ls(p2)

p2$values
p2$communality
p2$rot.mat

########################################################################################

#Calculating scores

scores <- p2$scores
scores_1 <- scores[,1]

min_score <- min(scores_1)
min_score

max_score <- max(scores_1)
max_score

summary(scores_1)

scores_2 <- scores[,2]
scores_3 <- scores[,3]
scores_4 <- scores[,4]
scores_5 <- scores[,5]
scores_6 <- scores[,6]


#Conducting Factor Analysis

fit = factanal(personality_views_opinions, 6)
print(fit$loadings, cutoff=.4, sort=T)
summary(fit)


#######################################################################################
#Using Factoextra
library(factoextra)

p3 <- prcomp(personality_views_opinions, scale = TRUE) 
fviz_eig(p3)

#PCA Individuals
pI<-fviz_pca_ind(p3,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
pI

#PCA Variables
pca_var<-fviz_pca_var(p3,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

pca_var

#Biplot
bi_plot<-fviz_pca_biplot(p3, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)

bi_plot

library("FactoMineR")
p4 <- PCA(personality_views_opinions, graph = FALSE)
#IF graph is set to true, it will provide the individual and variable maps

#Shows all the objects or functions available in PCA
print(p4)

#Options for providing screeplot
fviz_eig(p4, addlabels = TRUE, ylim = c(0, 35))
fviz_screeplot(p4, addlabels = TRUE, ylim = c(0, 35))

variables <- get_pca_var(p4)

#Which variables contibute the most to the PCs?
#there are ll variables
head(variables$contrib, 11)

library("corrplot")
corrplot(variables$contrib, is.corr=FALSE)    

# Contributions of variables to PC1
fviz_contrib(p4, choice = "var", axes = 1, top = 10)
# Contributions of variables to PC2
fviz_contrib(p4, choice = "var", axes = 2, top = 10)


library(ade4)
p5 <- dudi.pca(personality_views_opinions,
               scannf = FALSE,   # Hide scree plot
               nf = 3          # Number of components kept in the results
)
fviz_screeplot(p5, addlabels = TRUE, ylim = c(0, 35))

variables2 <- get_pca_var(p5)

#Which variables contibute the most to the PCs?
#there are ll variables
head(variables2$contrib, 11)

library("corrplot")
corrplot(variables2$contrib, is.corr=FALSE)    