data ex4;
input vendor $ type $ count @@;
datalines;
A rej 12 A acc 23 A per 89
B rej 8 B acc 12 B per 62
C rej 21 C acc 30 C per 119
;
run;
proc print data = ex4;
run;
proc freq data = ex4;
tables vendor*type / chisq expected norow nocol;
weight count;
run;
