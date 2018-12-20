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
proc means data = ex2;
var particle;
freq nn;
run;
data ex2_1;
input interval nn;
datalines;
1 11
2 37
3 36
4 16
;
run;
proc freq data = ex2_1;
tables interval / nocum testp = (13.6 32.4 35.6 18.4);
weight nn;
run;
