### Topic 2 SAS code
We use *Example 2.2* to demonstrate.

- Input data
  ```sas
  data = one;
  input cost @@; /* @@ indicates there is more than one observation on a line. */
  730 650 625 580 675 560 675 705 535 715
  ;
  run;
  ```

- Print data
  ```sas
  proc print data = one;
  var cost;
  run;
  ```
- Univariate
  ```sas
  proc univariate data = dataset <options>;
  var variables;
  run;
  ```
  **Univariate options**
  * `normal`: compute a statistic to test whether the data comes from a normal distribution.
  * `plot`: produces a stem-and-leaf plot, a box plot, and a normal probability plot.
  * `alpha`: the significance level.
  * `mu0`: the value of the mean $\mu_0$ in the null hypothesis.
  </br>
  
  Example 2.2:
  ```sas
  proc univariate data = one alpha = 0.05 mu0 = 617.5 normal plot
  var cost;
  run;
  ```
- Means 
  ```sas
  proc means data = dataset <options>;
  var variables;
  run;
  ```
  
  **Means Options:**
  *default values:*
  - `n`: sample size.
  - `min`: minimum value.
  - `max`: maximum value.
  - `mean`: mean value.
  - `std`: standard deviation. $(std = \frac{1}{n-1} \sum\limits_{i=1}^{n} (x-\bar{x})^2)$
  
  *can be specified:*
  - `nmiss`: the number of missing observations.
  - `range`: range.
  - `sum`: summ of all observations.
  - `var`: variance.
  - `stderr`: standard error of the mean.
  - `alpha`: significance level.
  - `clm`: confidence limits for the mean.
  - `t`: the *t*-statistic for testing whether the mean is significantly difference from 0.
  - `prt`: the *p*-value of the test.
  </br>
  
  **Example 2.2:**
  To test whether the mean is 617.5. 
  **Note: we need to add one variable $X = cost-617.5$ since `means` doesn't provide the attibute $\mu_0$.**
  </br>
  ```sas
  data one;
  input cost @@;
  X = cost-617.5;
  datalines;
  730 650 625 580 675 560 675 705 535 715
  ;
  run;
  proc means data = one t prt;
  var X;
  run;
  ```
 
- ttest
  ```sas
  proc ttest data = dataset h0 = mu;
  var variables;
  run;
  ```
  Example 2.3:
  test whether the mean of statistics score is 40.
  - Input the data 
    </br>
    ```sas
    data three;
    input name $ age math stat @@;
    X = stat-40;
    datalines;
    John 22 68 45
    Becky 19 83 70
    Grace 18 74 58
    David 20 77 54
    Helen 23 65 36
    Alan 19 60 41
    Janice 21 72 50
    Fanny 23 81 62
    ;
    run;
    ```
    **Note: $ means that the variable before $ is a string.**
  - Print out the data
    </br>
    ```sas
    proc print data = three;
    var name age math stat;
    run;
    ```
  - Hypothesis test
    </br>
    ```sas
    proc ttest data = three h0 = 40;
    var stat;
    run;
    ```
    or
    </br>
    ```sas
    proc ttest data = three;
    var X;
    run;
    ```
- Independent group t-test
  When we have two sets of data, we need to determine whether pooled *t*-test or two-sample *t*-test should be used by testing whether their variances are equal.
  As we have already known before, `proc ttest` can be used to test whether the population mean equals to a certain value, it can also be used to test whether the variances of the sets of data are equal.
  </br>
  ```sas
  proc ttest data = dataset;
  class variable; * the class variable can have only two values, either numeric or character.
  var variables;
  run;
  ```
  </br>
  Example 2.4:
  </br></br>
  
  ```sas
  data four;
  var group $ effect @@;
  datalines;
  C 80 C 93 C 83 C 89 C 98
  T 100 T 103 T 104 T 99 T 102
  ;
  run;
  
  /*test*/
  proc ttest data = four;
  class group;
  var effect;
  run;
  ```
  **Note: when we use one-side test, we need to multiply the *p*-value by 2.**
  </br>
  
- Dependent group t-test (paired *t*-test)
  </br>
  ```sas
  proc ttest data = dataset h0 = nu;
  paired variable*variable;
  run;
  ```
  
- One-Way ANOVA
  </br>
  ```sas
  proc glm data = dataset;
  class variables;
  model dependent variable = independent variables;
  means effects </options>;
  run;
  ```
  **Means options:**
  - `alpha=p`: significance level (default is 0.05).
  - `bon`: Bonferroni *t*-test of differences between means.
  - `cldiff`: confidence interval for all pair-wise differences between means.
  - `tukey`: Tukey's studentized range test.
  </br>
  
  Example 2.6:
  ```sas
  data shooters;
  input sighting $ score @@;
  datalines;
  R 12 R 10 R 18 R 12 R 14
  L 10 L 17 L 16 L 13
  B 16 B 14 B 16 B 11 B 20 B 21
  ;
  run;
  
  proc print data = shooters;
  var sighting score;
  run;
  
  proc glm data = shooters;
  class sighting; 
  model score = sighting;
  means sighting / tukey;
  run;
  ```
  
- Two-Way ANOVA
  </br>
  ```sas
  proc glm data = dataset;
  class variable1 variable2;
  model response variable = variable1 variable2 variable1*variable2;
  means variable1 variable2 variable1*variable2 / tukey lines;
  run;
  ```