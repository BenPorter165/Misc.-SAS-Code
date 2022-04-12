proc contents data=sashelp.cars;
run;

/*Some differences between PROC REG and PROC GLM*/
/* baseball  data */
/* PROC REG only allows for numerical variables to be in the 
   model */
/* PROC GLM does allow for character variables */    
proc glm data=sashelp.baseball plots(unpack)=diagnostics(label unpack);
class league division;
model logsalary = crHits nBB YrMajor league division;
id name ;
run;

/* if we want to add YrMajor as a quadratic term then this is 
straight forward in PROC GLM but not PROC REG */
proc glm data=sashelp.baseball plots(unpack)=diagnostics(label unpack);
class league division;
model logsalary = crHits nBB YrMajor YrMajor*YrMajor league division;
id name ;
run;
/*Add YrMajor squared in PROC REG but we have to define YrMajor squared 
first in a separate data step (see code Day 21 at the bottom)*/

/*HOWEVER, model diagnostics such as VIF, partial regression plots, Adjusted Rsquare 
are all much easier to obtain in PROC REG than PROC GLM (if at all in PROC GLM)*/


proc reg data=sashelp.cars plots=all;
model msrp = weight enginesize /vif partial;
run;

