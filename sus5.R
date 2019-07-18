### Loading R packages:
library(mice) 
library(randomForest)
#

### Load our new dataset: 
mydata <- read.csv('test.csv')
sum(is.na(mydata)) # Return 678 missing values! 
#
mydata <- subset( mydata, select = - weight )
mydata <- subset( mydata, select = - Target_cost_euro )
mydata <- subset( mydata, select = - Vehicle_annual_distance_km )


install.packages('VIM', dependencies = TRUE)
library(VIM)
## Imputing missing Data
result_knn<-kNN(mydata,k=6)

## Look at the result, No missing value available
sum(is.na(result_knn))

### Save the result:
write.csv(result_knn, 'filled_test_knn.csv')
