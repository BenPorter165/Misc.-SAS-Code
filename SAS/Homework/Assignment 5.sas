/* Question 1 */

/* a. */
/* First set appropriate path */
data work.trees5;
infile "&path/TREES5.csv" dlm = ',' firstobs=2 dsd;
input cover_name :$20. area :$20. elevation hdistfire;
run;

/* b. */
proc surveyselect data=work.trees5 
	method=srs 
	n=100
    seed=484584 
    out=work.trees_srs;
run;

/* c. */
proc freq data=work.trees_srs;
tables cover_name*area;
run;

/* d. */
/* No code */

/* e. */
proc freq data=work.trees5;
tables cover_name*area;
run;

/* f */
proc sort data=work.trees5;
by cover_name area;
run;

proc surveyselect data=work.trees5 
	method=srs 
	sampsize=40
    seed=484584 
    out=work.trees5_stratified;
   	strata cover_name area;
run;

/* g. */
proc print data=work.trees5_stratified (obs=20);
run;

/* Question 2 */

/* a. */
/* No code */
  
/* b. */
/* Code in part d.*/

/* c. */
/* No code */

/* d. */
proc ttest data=work.trees5 
	h0=2500
	sides=U;
var elevation;
run;

/* e. */
data work.trees_sub;
set work.trees5;
where area = "Comanche_Peak" or area = "Rawah";
run;

/* f.*/
/* Code to help create hypothesis statements */
proc sort data=work.trees_sub;
by area;
run;
proc means data=work.trees_sub mean;
var hdistfire;
by area;
run;

/* g. */ 
proc ttest data=work.trees_sub sides=2 alpha=0.05 h0=-1000;
title "Two sample t-test example";
class area; 
var hdistfire;
run;
   



