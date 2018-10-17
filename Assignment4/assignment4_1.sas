data one;
input weight orders;
datalines;
216	6.1
283	9.1
237	7.2
203	7.5
259	6.9
374	11.5
342	10.3
301	9.5
365	9.2
384	10.6
404	12.5
426	12.9
482	14.5
432	13.6
409	12.8
553	16.5
572	17.1
506	15.0
528	16.2
501	15.8
628	19.0
677	19.4
602	19.1
630	18.0
652	20.2
;
run;
proc reg data = one;
title "Assignment 4.1";
model orders = weight;
run;
proc corr data = one;
var weight orders;
run;
