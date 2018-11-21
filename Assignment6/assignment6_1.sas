data one;
input Y X1 X2 X3;
X11 = X1*X1; X1X2 = X1*X2; X22=X2*X2;
datalines;
26.7 17 76 1
10.7 4 62 0
22.0 9 76 1
8.7 1 30 1
18.4 12 68 1
31.8 23 84 0
13.6 5 43 1
17.8 8 72 1
12.8 2 80 0
23.0 15 60 1
13.1 8 35 0
11.7 3 90 0
28.6 22 55 1
16.8 7 54 0
15.6 14 25 0
9.3 2 51 0
18.6 11 73 1
25.0 14 80 1
21.8 8 90 0
10.6 5 44 0
. 10 65 1
;
run;
proc print data = one;
var Y X1 X2 X3;
run;
proc reg data = one;
model Y = X1 X2 X3 / p;
run;
proc reg data = one;
model Y = X1 X2 X3 X11 X22 X1X2 / p;
run;
