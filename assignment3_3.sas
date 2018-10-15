data three;
input time_of_day $ shoes $ shots @@;
datalines;
morning others 25
morning others 26
morning others 35
morning others 34
morning favorite 42
morning favorite 35
morning favorite 43
morning favorite 47
night others 27
night others 27
night others 33
night others 30
night favorite 30
night favorite 34
night favorite 36
night favorite 38
;
run;
proc print data = three;
var time_of_day shoes shots;
run;
proc glm data = three;
class time_of_day shoes;
model shots = time_of_day shoes time_of_day*shoes;
means time_of_day shoes time_of_day*shoes / tukey lines;
run;
