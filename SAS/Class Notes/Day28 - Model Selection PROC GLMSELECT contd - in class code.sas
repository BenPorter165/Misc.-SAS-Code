PROC GLMSELECT data=sashelp.cars plots=all;
class driveTrain make type origin;
model msrp = driveTrain make type origin 
             enginesize cylinders horsepower MPG_city 
             MPG_highway weight wheelbase length ;             
run;
