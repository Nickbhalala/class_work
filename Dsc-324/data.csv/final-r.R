#Libraries
library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(DescTools) #VIF Function
library(leaps) #Best Set Linear Regression Functions
setwd("~/Dsc-324/data.csv")
#Read in Datasets

training_values <- read.csv(file="data.csv", header=TRUE,  sep=",")

#Check Sample Size and Number of Variables
dim(training_values)
#3,808-Sample Size and 225 variables
#Show for first 6 rows of data
head(training_values)
#Show the structure of the data
str(training_values)
#Show names of the variables

#Check for Missing Values (i.e. NAs)

#For All Variables
sum(is.na(training_values))
#101103 total missing
#Treat Missing Values

#Listwise Deletion
#training_datasets <- na.omit(training_values)
library(psych)
describe(training_values)

#Create new subsets of data

training_datasets2 <- training_values[,c(2:85,87:94,96)]
str(training_datasets2)
#Show descriptive statistics
describe(training_datasets2)

library(Hmisc)
describe(training_datasets2)

 
library(psych)
library(REdaS)
library(dplyr)
library(ggplot2)
library(factoextra)
library("corrplot")
#Testing KMO Sampling Adequacy
#Tests sample size reliability
KMO(training_datasets2)#Overall MSA =  0.50


#Test Bartlett's Test of Sphericity
#testing for shared variance
bart_spher(training_datasets2)
#Test for Reliability Analysis using Cronbach's Alpha
#Assesses consistency of each factor / component 
alpha(training_datasets2,check.keys=TRUE)
#initial chronbach's alpha of all data in dataset
#raw_alpha = 0.022
#Chronbach's alpha analysis showed a reliability analysis with an alpha = 0.02 
training_p = prcomp(training_datasets2, center=T, scale=T)
training_p

#Check Scree Plot
plot(training_p ,main = "Bankrupt", xlab="Components")
abline(1, 0)
#enhanced scree plot

training_p %>% fviz_eig()
training_p2 = psych::principal(training_datasets2, rotate="varimax", nfactors=3, scores=TRUE)
training_p2
print(training_p2$loadings, cutoff=.2, sort=T)
training_datasets3 <- training_datasets2[,c(2:5,13,15:20 ,22:23,32,37:38,40:45,49:50,52,54:57,60:61,64:66,68,70,77:85,88:90,93)]
names(training_datasets3)

training_p = prcomp(training_datasets3, center=T, scale=T)
training_p

#Check Scree Plot
plot(training_p ,main = "Bankrupt", xlab="Components")
abline(1, 0)
#enhanced scree plot

training_p %>% fviz_eig()
training_p2 = psych::principal(training_datasets3, rotate="varimax", nfactors=3, scores=TRUE)
training_p2
summary(training_p)
print(training_p2$loadings, cutoff=.2, sort=T)
scores <- training_p2$scores
scores_1 <- scores[,1]
summary(scores_1)
scores_2 <- scores[,2]
summary(scores_2)
scores_3 <- scores[,3]
summary(scores_3)
scores_4 <- scores[,4]
summary(scores_4)
library(psych) #PCA/FA functions
library(factoextra) #PCA Visualizations
library("FactoMineR") #PCA functions
library(ade4) #PCA Visualizations
#cor(training_datasets2, method = "spearman")
#fit = factanal(training_datasets2, 3)
#print(fit$loadings, cutoff=.2, sort=T)
#summary(fit)

#Using Factoextra
library(factoextra)

p3 <- prcomp(training_datasets2, scale = TRUE) 
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
p4 <- PCA(training_datasets2, graph = FALSE)
#IF graph is set to true, it will provide the individual and variable maps

#Shows all the objects or functions available in PCA
print(p4)

#Options for providing screeplot
fviz_eig(p4, addlabels = TRUE, ylim = c(0, 35))
fviz_screeplot(p4, addlabels = TRUE, ylim = c(0, 35))

variables <- get_pca_var(p4)

#Which variables contibute the most to the PCs?
#there are ll variables
head(variables$contrib, 20)

library("corrplot")
corrplot(variables$contrib, is.corr=FALSE)    

# Contributions of variables to PC1
fviz_contrib(p4, choice = "var", axes = 1, top = 10)
# Contributions of variables to PC2
fviz_contrib(p4, choice = "var", axes = 2, top = 10)


library(ade4)
p5 <- dudi.pca(training_datasets2,
               scannf = FALSE,   # Hide scree plot
               nf = 3          # Number of components kept in the results
)
fviz_screeplot(p5, addlabels = TRUE, ylim = c(0, 35))

variables2 <- get_pca_var(p5)

library(MASS)

library(cluster)
library(factoextra)

# Let's first scale the data:
#Normalizing the Data

bankrupt_scale <- scale(training_datasets2) 


#K-Means Clustering

#Determining Optimal Number of Clusters
fviz_nbclust(bankrupt_scale, kmeans)


#Run K-Means Cluster Analysis

set.seed(123)
bankrupt_k2 <- kmeans(bankrupt_scale, centers=2, iter.max=123, nstart = 25)
bankrupt_k2
bankrupt_k2$size
bankrupt_k2$cluster
bankrupt_k2$centers

library("factoextra")
fviz_cluster(bankrupt_k2, data = bankrupt_scale, 
             ellipse.type = "convex",
             palette = "jco",
             repel = TRUE,
             ggtheme = theme_minimal())

#Another Way to Choose Optimal Clusters

#Enter name of the data matrix to be clustered here:
my.data.matrix <- bankrupt_scale 

my.k.choices <- 2:5
n <- length(my.data.matrix[,1])
wss1 <- (n-1)*sum(apply(my.data.matrix,2,var))
wss <- numeric(0)
for(i in my.k.choices) {
  W <- sum(kmeans(my.data.matrix,i)$withinss)
  wss <- c(wss,W)
}
wss <- c(wss1,wss)
plot(c(1,my.k.choices),wss,type='l',xlab='Number of clusters', ylab='Within-groups sum-of-squares', lwd=2)


#Aggregating the Clusters
bankrupt_k2_clust <- lapply(1:2, function(nc) row.names(training_datasets2)[bankrupt_k2$cluster==nc])  
bankrupt_k2_clust  # printing the clusters in terms of the row numbers


#Alternative Way of Running K-Means Clustering

library("factoextra")
# K-means clustering
bankrupt_kmeans2 <- eclust(bankrupt_scale, "kmeans", k = 2,
                       nstart = 25, graph = FALSE)

bankrupt_kmeans2

# Visualize the silhouette of clusters
fviz_silhouette(bankrupt_kmeans2)