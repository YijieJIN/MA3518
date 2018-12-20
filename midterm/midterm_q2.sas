data q2;
input area $ yield @@;
datalines;
X 1012 X 780 X 711 X 805 X 1294 X 666 X 779 X 1099 X 1314 X 1358
I 1101 I 1347 I 1520 I 1025 I 1462 I 1650 I 1903 I 1652 I 486 I 1144
;
run;
proc print data = q2;
run;
proc ttest data = q2 alpha = 0.05;
class area;
var yield;
run;
