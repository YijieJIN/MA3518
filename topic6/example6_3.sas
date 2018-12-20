data ex3;
input shift type $ count @@;
datalines;
1 A 15 1 B 21 1 C 45 1 D 13
2 A 26 2 B 31 2 C 34 2 D 5
3 A 33 3 B 17 3 C 49 3 D 20
;
run;
proc print data = ex3;
run;
proc freq data = ex3 order = data;
tables shift*type / chisq nocol norow expected;
weight count;
title 'Comparing Type of Defect with Shift Number';
run;
