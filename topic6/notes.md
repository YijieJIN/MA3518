## Topic 6 Chi-square Tests for Goodness-of-fit
1. Categorical Variables
   **Categorical Variable:** a variable which distinguishes among subjects by putting them into a limited number of categories, including type or kind.
   

2. $\chi^2$-test for several propotions
   * Cell probabilities are completely specified by the null hypothesis.
   * Cell probabilities are not completely specified by $H_o$


3. $\chi^2$-test for independence of two categorical variables


   
```sas
proc freq data = dataset;
  tables var1*var2 / <options>; /** var1 and var2 are independent variables. **/
  weight variable; /** variable is dependent variable. **/
run;
```
* **Table options:**
  * `chisq`: Compute the chi-square statistic for independence or homogeneity in two-way tables.
  * `expected`: Computes the expected counts for two-way tables.
  * `testp`: Specifies the hypothesized **percentages** in the same order as the corresponding variable levels appear in the frequency table.
  * `testf`: Specifies the hypothesized **frequencies** in the same order as the corresponding variable levels appear in the frequency table.
  * `nocol`: Omits the column percents from the table.
  * `norow`: Omits the row percents from the table.
  * `nocum`: Omits the cumulative frequencies for one-way tables.
  * `nofreq`: Omits the cell frequencies from the table.
  * `nopercent`: Omits any percents from the table.

**Example 6.1**
* Degree of freedom: 3
```sas
data ex1;
  input color $ count;
  datalines;
  Avocado 88
  Tan 65
  Red 52
  Blue 40
  White 55
  ;
run;

/** print out data **/
proc print data = ex1;
run;

/** Perform frequency test with Chi-square Distribution **/
proc freq data = ex1;
tables color / chisq;
weight count;
run;
```

**Example 6.2**
This question is a little bit complicated. We need to calculate the probability in normal distribution.

**Step 1: Calculate sample mean and variance. **
```sas
/** Input data **/
data ex2;
  input particle nn;
  datalines;
  7 1
  12 10
  17 37
  22 36
  27 13
  32 2
  37 1
  ;

proc print data = ex2;
run;

/** Calculate sample mean and variance. **/
proc means data = ex2;
  var particle;
  freq nn;
run;
```
In this step, we get the sample mean and sample standard deviation of 20 and 5 respectively. Now we are going to test whether the data are from normal distribution with population mean of 20 and population standard deviation of 5.

**Step 2: Calculate the probability according to normal distribution.**
```sas
data prob;
  x1 = cdf('normal', 9.5, 20, 5);
  x2 = cdf('normal', 14.5, 20, 5);
  x3 = cdf('normal', 19.5, 20, 5);
  x4 = cdf('normal', 24.5, 20, 5);
  x5 = cdf('normal', 29.5, 20, 5);
  x6 = cdf('normal', 34.5, 20, 5);
  x7 = 1-x6;
  x6 = x6-x5;
  x5 = x5-x4;
  x4 = x4-x3;
  x3 = x3-x2;
  x2 = x2-x1;
run;

proc print data = prob;
run;
```
**Results:**
![a5043d9a.png](attachments\a5043d9a.png)
After we get the probabilities, we need to aggregate few intervals into one. We combine the first two intervals together and the last three intervals together. Thus, we get x1 = 13.6, x2 = 32.4, x3 = 35.6, x4 = 18.4 (in frequency).

**Step 3: Test whether the data is from the normal distribution with Chi-square statistic.**
```sas
data ex2_1;
  input interval nn;
  datalines;
  1 11
  2 37
  3 36
  4 16
  ;
run;

/** Test **/
proc freq data = ex2_1;
  tables interval / nocum testp = (13.6 32.4 35.6 18.4);
  weight nn;
run;
```

**Example 6.3**
```sas
data ex3;
  input shift type $ count @@;
  datalines;
  1 A 15 1 B 21 1 C 45 1 D 13
  2 A 26 2 B 31 2 C 34 2 D 5
  3 A 33 3 B 17 3 C 49 3 D 20
  ;
run;

proc print data = ex3;
run;

/** Test **/
proc freq data = ex3 order = data;
  tables shift*type / chisq nocol norow expected; /** Omit the sum of column and sum of row. Show the expected frequencies **/
  weight count;
  title 'Comparing Type of Defect with Shift Number';
run;
```
**Note: In this test, we cannot get the p-value but the chi-square statistic only. We need to look for the rejected region in statistical table.** 

**Results:**
![e2837b91.png](attachments\e2837b91.png)

**Example 6.4**
```sas
data ex4;
  input vendor $ type $ count @@;
  datalines;
  A rej 12 A acc 23 A per 89
  B rej 8 B acc 12 B per 62
  C rej 21 C acc 30 C per 119
  ;
run;

/** Test **/
proc freq data = ex4;
  tables vendor*type / chisq expected norow nocol;
  weight count;
run;
```
**Results:**
![0ac5f96f.png](attachments\0ac5f96f.png)
![819c1253.png](attachments\819c1253.png)