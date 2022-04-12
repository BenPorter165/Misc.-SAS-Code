/***Use the baseball data set in the SASHELP library ***/

proc means data=sashelp.baseball nmiss
min q1 median q3 max maxdc=1; /*maxdc specifies the number of
								decimal places in the output*/
run;

/*create a new character variable 
that splits a numerical variable of your
choice into three levels:
< Q1 -- 'low'
Q1<= variable <= Q3 -- 'middle' 
> Q3 -- 'high'
*/

/*requires a data step as we do not have write access 
to data sets in the SASHELP library*/
data work.baseball;
set sashelp.baseball;
Length CrHitsC $10; /*Controls the length of the new variable*/
if CrHits = . then CrHitsC=' '; /*in case we have missing values*/
else if CrHits < 227 then CrHitsC='low';
else if 227 <= CrHits <= 1102 then CrHitsC='middle';
else CrHitsC='high';
run;
/*Note that the cut-off values come from the previous proc means 
analysis*/


/*quick check that both variables are */
proc print data = work.baseball (obs=20);
var CrHits CrHitsC;
run;

/** Selecting and Deselecting SAS output **/
/** use 'ods trace on' and 'ods trace off' **/
/** ods -- output delivery system **/
proc freq data = sashelp.birthwgt nlevels;
tables _all_ / noprint;
run;

ods trace on; /*tells SAS to print the names of all 
				output tables in the Log window*/
proc freq data = sashelp.birthwgt;
tables race / chisq expected; /*Goodness of Fit Test 
					assessing whether all five race 
					groups are equally represented in
					the data set, i.e. p=0.2 for each level*/
run;
ods trace off;/*closes the tracing*/

/*Now that we know the table names we will use them 
to deselect (or select) the output we want to have */
proc freq data = sashelp.birthwgt;
tables race / chisq expected; /*Goodness of Fit Test 
					assessing whether all five race 
					groups are equally represented in
					the data set*/
ods select OneWayChiSq OneWayFreqs;
/*ods exclude DeviationPlot;*/ 
run;

/**the above ods select and ods exclude statements are 
equivalent. Normally we would use ods exclude because it is more
efficient.**/


/*** Goodness of Fit Test ***/
/*** Specify H0 different from default H0
which is equal proportions across all categories ***/

proc freq data = sashelp.birthwgt;
table agegroup / expected chisq testp=(0.3333 0.3333 0.3333);
run;




