data q4;
input concen num response @@;
datalines;
1 1 3.15 1 1 3.23 1 1 3.14
1 2 3.43 1 2 3.37 1 2 3.24
1 3 3.55 1 3 3.43 1 3 3.38
3 1 3.15 3 1 3.27 3 1 3.13
3 2 3.12 3 2 3.28 3 2 3.13
3 3 3.25 3 3 3.33 3 3 3.40
;
run;
proc print data = q4;
run;
proc glm data = q4;
class concen num;
model response = concen num concen*num;
means concen num concen*num / tukey lines;
run; 
