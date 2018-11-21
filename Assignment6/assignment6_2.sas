data two;
input x1 x2 y;
x11 = x1*x1; x22 = x2*x2; x12 = x1*x2;
datalines;
1.3 5 3.5
0.9 6 2.8
1.1 7 3.2
0.7 3 2.0
1.8 4 3.8
1.0 5 2.8
1.4 7 3.5
0.8 6 2.5
1.0 9 3.2
1.5 8 3.7
1.3 6 3.6
1.6 8 3.8
1.2 7 .
;
run;
proc print data = two;
var x1 x2 y;
run;
proc reg data = two;
model y = x1 x2 /r cli clm;
run;
proc reg data = two;
model y = x1 x2 x11 x12 x22 / r cli clm;
run;
proc reg data = two;
model y = x1 x2 x11 x12 / r cli clm;
run;
proc reg data = two;
model y = x1 x2 x11 x22 / r cli clm;
run;
proc reg data = two;
model y = x1 x2 x12 x22 / r cli clm;
run;
proc reg data = two;
model y = x1 x2 x11 / r cli clm;
run;
proc reg data = two;
model y = x1 x2 x12 / r cli clm;
run;
proc reg data = two;
model y = x1 x2 x22 / r cli clm;
run;
