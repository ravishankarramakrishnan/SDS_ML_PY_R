# Simple Linear Regression

# Data Preprocessing

# Importing the Dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[ ,2:3]

# Splitting the Dataset into Training set and Test set
# install.packages('caTools')  - To install a package
library(caTools)   #- To select the library in manual way
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE) 

# Feature Scaling
# training_set[ , 2:3] = scale(training_set[ , 2:3])
# test_set[ , 2:3] = scale(test_set[ , 2:3])

# Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the test set results
Y_pred = predict(regressor, newdata = test_set)

# Visualising the Training Set results
# install.packages('ggplot2') - To install new Package
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Training Set)') +
  xlab('YearsofExperience') + 
  ylab('Salary')

# Visualising the Test Set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Test Set)') +
  xlab('YearsofExperience') + 
  ylab('Salary')









