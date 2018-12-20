data ex3;
input name $ age math stat;
Y = stat-40;
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
proc print data = ex3;
var name math stat;
run;
proc means data = ex3 alpha = 0.05 clm; 
var math;
run;
proc univariate data = ex3 mu0 = 40;
var stat;
run;
proc means data = ex3 alpha = 0.05 t prt;
var Y;
run;
