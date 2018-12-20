data ex3;
input age number price @@;
datalines;
127 13 1235
115 12 1080
127 7 845
150 9 1522
156 6 1047
182 11 1979
156 12 1822
132 10 1253
137 9 1297
113 9 946
137 15 1713
117 11 1024
137 8 1147
153 6 1092
117 13 1152
126 10 1336
170 14 2131
182 8 1550
162 11 1884
184 10 2041
143 6 854
159 9 1483
108 14 1055
175 8 1545
108 6 729
179 9 1792
111 15 1175
187 8 1593
111 7 785
115 7 744
194 5 1356
168 7 1262
;
run;
proc print data = ex3;
run;
proc reg data = ex3;
model price = age number / clb;
/**plot price*age = '+'p.*age = '*' / overlay;**/
/**plot price*number p.*number / overlay**/;
run;
