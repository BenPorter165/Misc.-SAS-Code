/*Fit a generalized linear model using 
PROC GLM
- response: numerical
- explanatory variables: numerical and character
*/


proc glm data=sashelp.iris plots=diagnostics(unpack);
class species; /* all character variables need to be
                  listed in the class statement*/
model petallength = petalwidth sepallength sepalwidth species/ 
                    solution ;
title 'Multiple Linear Regression Model';
run;                    
                 
                 
/* Fit similar model using PROC REG */   

/*requires all explanatory variables to be numerical*/
proc reg data=sashelp.iris plots=diagnostics;
model petallength = petalwidth sepallength sepalwidth / vif;
/*vif - variance inflation factor identifies multicollinearity 
among explanatory variables */
run;

data iris;
set sashelp.iris;
if species = 'Setosa' then SpSetosa = 1;
else SpSetosa = 0;
if species = 'Versicolor' then SpVersicolor = 1;
else SpVersicolor = 0;
run;

proc reg data=iris plots=diagnostics;
model petallength = petalwidth sepallength sepalwidth 
        SpSetosa SpVersicolor / vif;
/*vif - variance inflation factor identifies multicollinearity 
among explanatory variables */
run;
              
                 