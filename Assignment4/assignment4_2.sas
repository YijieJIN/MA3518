data two;
input number_of_cases time;
datalines;
52	32.1
64	34.8
73	36.2
85	37.8
95	37.8
103	39.7
116	38.5
121	41.9
143	44.2
157	47.1
161	43.0
184	49.4
202	57.2
218	56.8
243	60.6
254	61.2
267	58.2
275	63.1
287	65.6
298	67.3
;
run;
proc reg data = two;
title "Assignment 4.2";
model time = number_of_cases;
run;
proc corr data = two;
var number_of_cases time;
run;
