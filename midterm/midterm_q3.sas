data q3;
input type $ height @@;
datalines;
G 78 G 74 G 78 G 73 G 77 G 73
F 81 F 84 F 80 F 84 F 82 F 81 F 82
C 84 C 90 C 83 C 85 C 87 C 83
;
run;
proc print data = q3;
run;
proc glm data = q3 alpha = 0.01;
class type;
model height = type;
means type / tukey lines;
run;
proc ttest data = q3 alpha = 0.01;
class type;
var height;
run;
data q31;
input type $ height @@;
datalines;
G 78 G 74 G 78 G 73 G 77 G 73
;
run;
data q32;
input type $ height @@;
datalines;
F 81 F 84 F 80 F 84 F 82 F 81 F 82
;
run;
data q33;
input type $ height @@;
datalines;
C 84 C 90 C 83 C 85 C 87 C 83
;
run;
proc univariate data = q31;
var height;
run;
proc univariate data = q32;
var height;
run;
proc univariate data = q33;
var height;
run;
