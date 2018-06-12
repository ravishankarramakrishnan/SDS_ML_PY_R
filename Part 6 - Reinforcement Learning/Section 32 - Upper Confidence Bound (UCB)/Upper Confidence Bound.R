# Upper Confidence Bound

# Importing the Dataset
dataset <- read.csv('Ads_CTR_Optimisation.csv')

# Implementing the Upper Confidence Bound
N = 10000
d = 10
ads_selected = integer(0)
numbers_of_selection = integer(d)
sums_of_reward = integer(d)
total_reward = 0
for (n in 1:N) {
  ad = 0
  max_upper_bound = 0
  for( i in 1:d) {
    if(numbers_of_selection[i] > 0){
      average_reward = sums_of_reward[i] / numbers_of_selection[i]
      delta_i = sqrt(3/2 * log(n+1) / numbers_of_selection[i])
      upper_bound = average_reward + delta_i
    } else {
      upper_bound = 1e400
    }
    if(upper_bound > max_upper_bound) {
      max_upper_bound = upper_bound
      ad = i
    }
  }
  ads_selected = append(ads_selected , ad)
  numbers_of_selection[ad] = numbers_of_selection[ad] + 1
  reward = dataset[n,ad]
  sums_of_reward[ad] = sums_of_reward[ad] + reward
  total_reward = total_reward + reward
}

# Visualising the results
hist(ads_selected,
     col = 'blue',
     main = 'Histogram of Ad Selection',
     xlab = 'Ads',
     ylab = 'No. of times each ads selected')
