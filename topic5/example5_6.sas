data ex6;
input x1 x2 y;
x11 = x1*x1; x12 = x1*x2; x22 = x2*x2;
datalines;
5.9 47 2.60
3.2 145 3.90
4.4 202 8.00
6.6 160 9.20
0.75 280 4.40
0.7 80 1.50
6.5 240 14.50
4.5 53 1.90
0.6 100 1.00
7.5 190 14.00
5.1 240 11.00
2.4 209 5.00
0.3 160 2.00
6.2 115 6.00
2.7 45 1.10
3.5 250 8.00
4.1 95 3.30
8.1 160 12.10
7.0 260 15.50
1.1 90 1.70
;
run;
proc print data = ex6;
run;
proc reg data = ex6;
model y = x1 x2 x11 x12 x22 / p cli clm clb;
run;
proc reg data = ex6;
model y = x1 x2 x12 / p cli clm clb;
run;
data prob;
x = finv(0.95,2,14);
run;
proc print data = prob;
run;
