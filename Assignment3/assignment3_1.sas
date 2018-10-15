data one;
input environment $ strain $ score @@;
datalines;
free bright 28 free bright 12
free bright 22 free bright 23
free bright 25 free bright 10
free bright 36 free bright 86
free mixed 33 free mixed 83
free mixed 36 free mixed 14
free mixed 41 free mixed 76
free mixed 22 free mixed 58
free dull 101 free dull 94
free dull 33 free dull 56
free dull 122 free dull 83
free dull 35 free dull 23
restricted bright 72 restricted bright 32
restricted bright 48 restricted bright 93
restricted bright 25 restricted bright 31
restricted bright 91 restricted bright 19
restricted mixed 60 restricted mixed 89
restricted mixed 35 restricted mixed 126
restricted mixed 83 restricted mixed 110
restricted mixed 99 restricted mixed 118
restricted dull 136 restricted dull 120
restricted dull 38 restricted dull 153
restricted dull 64 restricted dull 128
restricted dull 87 restricted dull 140
;
run;
proc glm data = one alpha = 0.01;
class  environment strain;
model score = environment strain environment*strain;
means environment strain environment*strain / tukey lines;
run;
proc print data = one;
var environment strain score;
run;
