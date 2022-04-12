/*sashelp.baseball*/

/* 
-proc contents
-proc print: first 15 observations
-create a frequency table of the variable division 
 (need to identify proper variable name first) 
-get the 5 number summary for three numerical 
variables of your choice
-proc sort: sort by a character variable in descending 
order followed by a numerical variable in ascending order 
*/


/**********SOLUTION************/

title 'Data set Overview';
proc contents data=sashelp.baseball;
run; /*322 observations, 24 variables*/

title 'First 15 observations';
proc print data=sashelp.baseball (obs=15);
run; /*the first 15 observations for ALL variables 
     will be printed. To subset to specific 
     variables use the var statement */
    

proc print data=sashelp.baseball (obs=15);
var name team div salary;
run;

title 'Frequency Table of Division';
proc freq data=sashelp.baseball;
table div;
run;

title '5-Number Summary';
proc means data= sashelp.baseball min P25 P50 P75 max;
var CrAtBat CrHits CrHome;
run;
/*P23=Q1, P50=median, P75=Q3*/

/*Data sorted by Team and # of Career Home Runs*/
proc sort data = sashelp.baseball out=work.basekball;
by descending team CRhome;
run;
