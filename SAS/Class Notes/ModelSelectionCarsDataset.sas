PROC GLMSELECT data=sashelp.cars;
class driveTrain make type origin;
model msrp = driveTrain make type origin 
             enginesize cylinders horsepower MPG_city 
             MPG_highway weight wheelbase length /
             selection=stepwise showpvalues details=summary 
             stats=(cp PRESS) ;
run;

proc glm data=sashelp.cars plots=all;
class drivetrain origin;
model msrp = drivetrain origin horsepower mpg_city weight length
             wheelbase/ solution;
run;             

/*overall residual plot for the model suggests increasing 
variance as msrp increases --> try log transformation of MSRP*/

data work.cars;
set sashelp.cars;
lmsrp = log(msrp);
run;

proc glm data=work.cars plots=all;
class drivetrain origin;
model lmsrp = drivetrain origin horsepower mpg_city weight length
             wheelbase/ solution;
run;     

/*Out of curiosity let's rerun the model selection 
thisd time using lmsrp as the response */

PROC GLMSELECT data=work.cars;
class driveTrain make type origin;
model lmsrp = driveTrain make type origin 
             enginesize cylinders horsepower MPG_city 
             MPG_highway weight wheelbase length /
             selection=stepwise showpvalues details=summary 
             stats=(cp PRESS) ;
run;

proc glm data=work.cars plots=all;
class make type ;
model lmsrp = make type enginesize horsepower mpg_city weight 
              / solution effectsize;
run;              
/*This model appears to be fitting very well.*/




proc glm data=work.cars plots=all;
class make ;
model msrp = horsepower weight make enginesize mpg_city
              / solution;
run;

proc glm data = work.cars plots=all;
class origin drivetrain;
model msrp = drivetrain origin horsepower MPG_city weight wheelbase
             length / solution;
run;    

proc glm data = work.cars plots=all;
class origin drivetrain;
model lmsrp = drivetrain origin horsepower MPG_city weight wheelbase
             length / solution;
run;      


proc sgplot data=sashelp.cars;
histogram msrp ;
density msrp / type=kernel;
run;    