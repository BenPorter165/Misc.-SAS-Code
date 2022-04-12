/* Model salaries of Baseball Players 
who played at least one game in both the 
1986 and 1987 season excluding pitchers.
*/

proc contents data=sashelp.baseball varnum;
ods select position;
run;

/* use logsalary as response variable because 
the distribution of salaries is highly skewed and
much more variable than the distribution of 
the logsalaries */

/* explanatory variables: batting statistics from 
 the previous season and lifetime batting performance 
 -nHits
 -nRuns
 -nRBI
 -nBB
 -YrMajor
 -CrHits
 */

proc reg data=sashelp.baseball;
id name team league;
model logsalary = nhits nruns nrbi nbb yrmajor crhits;
run;
/*diagnostic plots suggest some influencial data points 
  that affect the model fit; we are overpredicting salaries 
  at the lower end of the distribution and underpredicting
  higher salaries */
 
proc reg data=sashelp.baseball 
    plots(only label)=(RStudentByLeverage CooksD); 
id name team league;
model logsalary = nhits nruns nrbi nbb yrmajor crhits;
run; 

/*three players that appear to be outliers & leverage 
 points: Pete Rose, Steve Sax and Reggie Jackson 
 worthwhile to examine their effect on the model parameters
 and model predictions 
*/

/*temporarily exlude Pete Rose to better understand the effect*/
proc reg data=sashelp.baseball 
    plots=(RStudentByLeverage(label) residuals(smooth)); 
    where name^="Rose, Pete";
id name team league;
model logsalary = nhits nruns nrbi nbb yrmajor crhits;
run;
/* we see some changes but the most important piece of
information comes from the partial residual plots which suggest 
that YrMajor and CrHits have a more complex non-linear relationship
with logSalary*/


/*Start out with quadratic terms*/
data baseball;
set sashelp.baseball(where=(name^="Rose, Pete"));
YrMajor2=yrMajor*yrMajor;
CrHits2=CrHits*CrHits;
run;

proc reg data=baseball 
    plots=(RStudentByLeverage(label) residuals(smooth)); 
id name team league;
model logsalary = nhits nruns nrbi nbb yrmajor crhits 
                  yrmajor2 crhits2 ;
run;

/*The model improves, especially the Rsquare increases and 
the added quadratic terms are highly significant. However, the
residual plots and leverage, Cook's D plots still suggest 
room for improvement.  */


