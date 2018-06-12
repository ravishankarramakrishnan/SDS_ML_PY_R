# Hierarchical Clustering

# Importing the Dataset
dataset <- read.csv('Mall_Customers.csv')
X = dataset[4:5]

# Using Dendrogram to find Optimum number of Clusters
dendrogram = hclust(dist(X,method = 'euclidean'),method = 'ward.D')
plot(dendrogram,
     main = paste("Dendrogram"),
     xlab = 'Customers',
     ylab = 'Euclidean Distances')

# Fitting Hierarchical Clustering to the Dataset
hc = hclust(dist(X,method = 'euclidean'),method = 'ward.D')
y_hc = cutree(hc,5)

# Visualizing the Results
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster of Clients"),
         xlab = 'Annual Income',ylab = "Spending Score")
