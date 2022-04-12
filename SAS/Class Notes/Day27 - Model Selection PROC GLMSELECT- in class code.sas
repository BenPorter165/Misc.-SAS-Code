/*PROC GLMSELECT*/
/*Purpose: Variable selection from a set 
of categorical and numerical variables
*/

/*use the sashelp.cars to explore the use 
of GLMSELECT */

PROC GLMSELECT data=sashelp.cars;
class driveTrain make model type origin;
model msrp = driveTrain make model type origin 
             enginesize cylinders horsepower MPG_city 
             MPG_highway weight wheelbase length /
             selection=stepwise showpvalues details=all ;
run;

/*EXLCUDE variable "MODEL" bc it has 423 levels and with
 only 426 observations to use including model will result
 in a perfect (RSquare=1) but unusable model because 
 it overfits the data (the model perfectly explains the 
 variation in the msrp but will do poorly when applied 
 to new data)*/

PROC GLMSELECT data=sashelp.cars;
class driveTrain make type origin;
model msrp = driveTrain make type origin 
             enginesize cylinders horsepower MPG_city 
             MPG_highway weight wheelbase length /
             selection=stepwise showpvalues details=summary 
             stats=(cp PRESS) ;
             /*details = all procides model fit indicies at every
             step of the variable selection*/
run;
