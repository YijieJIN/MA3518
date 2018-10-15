data two;
input gender $ school score @@;
datalines;
M 1 631 M 1 566 M 1 620 M 1 542 M 1 560
M 2 642 M 2 710 M 2 649 M 2 596 M 2 660
M 3 651 M 3 611 M 3 755 M 3 693 M 3 620
M 4 350 M 4 565 M 4 543 M 4 509 M 4 494
F 1 669 F 1 644 F 1 600 F 1 610 F 1 559
F 2 722 F 2 769 F 2 723 F 2 649 F 2 766
F 3 709 F 3 545 F 3 657 F 3 722 F 3 711
F 4 505 F 4 498 F 4 474 F 4 470 F 4 463
;
run;
proc print data = two;
var gender school score;
run;
proc glm data = two;
class gender school;
model score = gender school gender*school;
means gender school gender*school;
run;
 
