# Multiple Linear Regression

# Simple Linear Regression

# Data Preprocessing

# Importing the Dataset
dataset = read.csv('50_Startups.csv')
#dataset = dataset[ ,2:3]

# Encoding Categorical Data
dataset$State = factor(dataset$State,
                         levels = c('New York','California','Florida'),
                         labels = c(1,2,3))
 

# Splitting the Dataset into Training set and Test set
# install.packages('caTools')  - To install a package
library(caTools)   #- To select the library in manual way
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE) 

# Feature Scaling
# training_set[ , 2:3] = scale(training_set[ , 2:3])
# test_set[ , 2:3] = scale(test_set[ , 2:3])

# Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, # or (formula = profit ~ .)
               data =  training_set)

# Predicting the Test Set Result
y_pred = predict(regressor, newdata = test_set)

# Building Optimal Model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, # or (formula = profit ~ .)
               data =  dataset)
summary(regressor)

# Removing Features for getting Optimal Model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, # or (formula = profit ~ .)
               data =  dataset)
summary(regressor)

# Removing Features for getting Optimal Model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend +  Marketing.Spend, # or (formula = profit ~ .)
               data =  dataset)
summary(regressor)

# Removing Features for getting Optimal Model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend , # or (formula = profit ~ .)
               data =  dataset)
summary(regressor)
 

