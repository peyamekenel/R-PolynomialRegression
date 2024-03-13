# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

lin_reg = lm(formula = Salary ~ .,data = dataset)

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~.,data = dataset)

#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary ),colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(lin_reg,newdata = dataset,) ),colour = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression) ') +
  xlab('Level') +
  ylab('Salary') 
  
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary ),colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(poly_reg,newdata = dataset,) ),colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression) ') +
  xlab('Level') +
  ylab('Salary') 

#Predicted salary for level 6.5
y_pred_linreg = predict(lin_reg, data.frame(Level = 6.5))
y_pred_polyreg = predict(poly_reg, data.frame(Level = 6.5, Level2 =6.5^2 , Level3=6.5^3, Level4=6.5^4 ))


