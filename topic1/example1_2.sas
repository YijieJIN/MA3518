data ex2;
input method $ score @@;
datalines;
R 12 L 10 B 16
R 10 L 17 B 14
R 18 L 16 B 16
R 12 L 13 B 11
R 14 B 20 B 21
;
run;
proc print data = ex2;
run;
proc glm data = ex2;
class method;
model score = method;
means method / tukey lines;
run;
