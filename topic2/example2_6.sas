data ex6;
input m f;
datalines;
90 95
87 85
100 84
80 89
95 95
90 95
88 90
67 86
;
run;
proc print data = ex6;
run;
proc ttest data = ex6 alpha = 0.05;
paired m*f;
run;
