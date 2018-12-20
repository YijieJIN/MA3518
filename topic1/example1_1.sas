data ex1;
input type time @@;
datalines;
1 25.4 1 26.31 1 24.1 1 23.74 1 25.1
2 23.4 2 21.8 2 23.5 2 22.75 2 21.6
3 20 3 22.2 3 19.75 3 20.6 3 20.4
;
run;
proc print data = ex1;
run;
proc glm data = ex1;
class type;
model time = type;
means type;
run;
