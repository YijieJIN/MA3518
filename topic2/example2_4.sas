data ex4;
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
proc print data = ex4;
run;
proc ttest data = ex4 alpha = 0.05;
var Y;
run;
proc ttest data =ex4 h0 = 40;
var stat;
run;
proc means data = ex4 clm;
var stat;
run;
