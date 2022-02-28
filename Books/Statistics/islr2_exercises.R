library(car)
library(ISLR2)
library(tidyverse)

# CHAPTER 3 LINEAR REGRESSION APPLIED EXERCISES ----
## DO EXERCISES 5 1 6

# 8. This question involves the use of simple linear regression on the Auto data set.
  # (a) Use the lm() function to perform a simple linear regression with mpg 
    # as the response and horsepower as the predictor. 
    mod <- lm(mpg ~ horsepower, data = Auto)
    # Use the summary() function to print the results. Comment on the output.
    summary(mod)
    # For example:
      # i. Is there a relationship between the predictor and the response?
      # Yes cause the F statistic is large and the associated p-value is below 5%.

      # ii. How strong is the relationship between the predictor and the response?
      # We answer this question with the RSE and R2. The former estimates 
      # the standard deviation of the response from the population regression line. 
      # For our  data, the RSE is 4.906 units while the mean value for the response 
      # is 23.44592, indicating a percentage error of roughly 21%. 
      # Second, the R2 statistic records the percentage of variability in the response
      # that is explained by the predictors. The predictors explain almost 
      # 61% of the variance in mpg.

      # iii. Is the relationship between the predictor and the response positive or negative?
      # The relationship is negative as told by the coefficient sign. 

      # iv. What is the predicted mpg associated with a horsepower of 98? 
      # What are the associated 95% confidence and prediction intervals?
      # For a horsepower of 98, the predicted mpg is 24.46708.
      # The 95% confidence and prediction intervals are respectively :
      predict(mod, data.frame(horsepower = 98), interval = "confidence") # [23.97308, 24.96108]
      predict(mod, data.frame(horsepower = 98), interval = "prediction") # [14.8094, 34.12476]
      
  # (b) Plot the response and the predictor. Use the abline() function
      # to display the least squares regression line.
      plot(Auto$horsepower, Auto$mpg)
      abline(mod, col = "red")
      # ggplot alternative
      Auto %>%
        ggplot(aes(horsepower, mpg)) +
        geom_point() +
        geom_smooth(method = "lm", color = "red", se = F)
      
  # (c) Use the plot() function to produce diagnostic plots of the least
      # squares regression fit. Comment on any problems you see with the fit.
      par (mfrow = c (2, 2))
      plot (mod)
      # the relationship doesn't appear to be linear as displayed in the top left plot
      # variance of errors doesn't seem equal
      # some points have high leverage

      
# 9. This question involves the use of multiple linear regression on the Auto data set. 
  # (a) Produce a scatterplot matrix which includes all of the variables in the data set.
      plot(Auto)
  # (b) Compute the matrix of correlations between the variables using the function cor(). 
      # You will need to exclude the name variable, which is qualitative.
      cor(Auto[,-9])
  

