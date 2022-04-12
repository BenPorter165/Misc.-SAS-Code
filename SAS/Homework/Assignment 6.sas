/* Step 1: Import the data set start-up.csv*/
/* Step 2: Print the data set and verify that the data were read in properly*/

/* Step 3: Run the following code until the line 'End Chunk 1, part b)' */
data startup;
set import;
run;

data startup_long;
set startup;
type='pizza';
amount=pizza;
output;
type='donuts';
amount=donuts;
output;
type='shoes';
amount=shoes;
output;
type='gift';
amount=gift;
output;
type='pet';
amount=pet;
output;
drop pizza donuts shoes gift pet;
run;

/*End Chunk 1, part b)*/

/*Step 4: Run the following code until the line 'End Chunk 2, part d)'*/

proc format;
value $typefmt   'pizza'='Pizza shop'
               'donut' = 'Donut shop'
                  'pet' = 'Pet store'
                 'gift' = 'Gift shop'
                'shoes' = 'Shoe store'
;
run;

proc sgplot data=startup_long;
format type $typefmt.;
   vbox amount / category=type; 
   xaxis label="Type of Start-up";
   yaxis label="Amount (in thousands of dollars) ";
   title 'Distribution of Start-up Costs by Store Type';
run;


/*End Chunk 2, part d)*/


/*Question 3*/
/* Chunk 3 */
/*update the path in the libname statement accordingly*/
libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";

proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; /*has 4 levels: Ex Fa Gd TA*/
model saleprice = heating_qc;
title 'One-way ANOVA predicting sale price using 
 heating_qc';
run;
 