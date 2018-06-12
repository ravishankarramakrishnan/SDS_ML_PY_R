# Eclat

# Import the dataset
# install.packages('arules')
library(arules)
dataset <- read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot( dataset,topN = 10)

# Training Eclat on the Dataset 
rules = eclat(data = dataset, parameter = list(support = 0.004 , minlen = 2))

# Visualizing the Results
inspect(sort(rules, by = 'support')[1:12])
