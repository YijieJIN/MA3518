### Topic 5 Multiple Regression
1. Simple linear Regression Model
```sas
proc reg data = <dataset>;
model dependent var = independent variables </options>;
plot yvariable*xvariable <=symbol> </options>;
```

**Model Option:**
* `clm`: Print 95% **confidence intervals** for the means of each obervation.
* `cli`: Print 95% **prediction intervals** of each observation. 
* `clb`: Print 95% **confidence interval** of parameter estimates. 
* `p`: Print the observed value of independent variable, the predicted value, and the residual for each observation in the dataset.
* `r`: Print everything the p-option prints plus the standard errors of the predicted values and residuals, the studentized residuals; create a small residual plot vs. the observation number.
* `noint`: Fits a model without the intercept term.

**Plot options:**
* `overlay`: tells SAS to print any requested plots as one plot. Without `overlay`, seperate plots would be generated.









