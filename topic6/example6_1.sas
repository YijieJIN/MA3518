data ex1;
input color $ count;
datalines;
Avocado 88
Tan 65
Red 52
Blue 40
White 55
;
run;
proc print data = ex1;
run;
proc freq data = ex1;
tables color / chisq;
weight count;
run;
