/*Analysis of numerical variables*/
/* The MEANS Procedure calculates numerical summaries of quantitative 
(numerical) variables.
var statement - allows you to specify variables of interest
if var statement is omitted all variables will be analyzed */
title 'Numerical Summaries of Variable # of Documents';
proc means data=sashelp.ital_multi  ;
run;

/*In the proc means statement you can specify a variety of 
summary statistics, see SAS documention for complete list of options
look up 'statistic-keyword(s)' in the Proc Means documentation 
in SAS:
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/n1qnc9bddfvhzqn105kqitnf29cp.htm#n11nn4xu6p9wvjn1lh60wtvvn538
 */
title 'Percentiles of Variable # of Documents';
proc means data=sashelp.ital_multi  P10 P25 P50 median
P75 P90 Nmiss;
var numdocs;
run;


/*Sort a data set by one or more variables of interest*/

proc sort data=sashelp.ital_multi;
by role;
run; /*results in error message because we cannot
overwrite the data set in the SASHELP library*/

/*Option 1: write out the new and sorted data set*/
/*
new data set stored for the duration of the SAS session
in the 'work' directory
*/
proc sort data=sashelp.ital_multi out=work.ital_multi;
by role;
run;

/*Option 2: create a new data set using a DATA STEP*/
/*
new data set stored for the duration of the SAS session
in the 'work' directory
*/
data work.ital_multi1;
set sashelp.ital_multi;
run;

proc sort data=work.ital_multi1;
by role descending numdocs; /*sort by role from A to Z as default is ascending */
run;       /*followed by # of documents sorted from largest 
             to smallest, note that descending needs to preceed 
             the variable name in the by statement*/


/**********************************************************/ 
/*************** Where Statements *************************/
/**********************************************************/ 

/* where statements allow the subsetting of data sets
-we can specify a condition for a variable by which we want to subset.
- here we will subset to all players in the American East (AE) 
division
-always use quotation marks for char variables
-unlike all other statements in SAS, levels of char variables
are case sensitive */

proc print data=sashelp.baseball;
where div = 'AE';
var name team salary logsalary; 
run;
/*where div = 'ae'; will result in
an error message because unlike everywhere else upper vs. 
lower case matters*/

proc print data=sashelp.baseball;
where div = 'AE' and salary = . ; /* subset to players in the 
                                   AE division with missing 
                                   salary information, 
                                   . indicates missing value */
var name team ;  /*select variables we want*/
run;

