data ex2;
input cost;
X = cost-617.5;
datalines;
730
650
625
580
675
560
675
705
535
715
;
run;
proc print data = ex2;
run;
proc univariate data = ex2 mu0 = 617.5 normal;
var cost;
run;
proc means data = ex2 nmiss range sum var stderr alpha = 0.05 clm t prt;
var X;
run;
