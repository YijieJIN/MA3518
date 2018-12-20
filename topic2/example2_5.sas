data ex5;
input group $ time @@;
datalines;
C 80 T 100
C 93 T 103
C 83 T 104
C 89 T 99
C 98 T 102
;
run;
proc print data = ex5;
run;
proc ttest data = ex5;
class group;
var time;
run;
