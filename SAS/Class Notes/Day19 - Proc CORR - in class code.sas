/* IRIS data set */
/* 4 numerical measurements and one character one: species */
/* response: petalwidth -- arbitrary choice */

/* Go under Tasks and Utilities ---> 
   Statistics ---> Correlation Analysis */
/* depending on selection, SAS Studio will 
   generate the code below or code similar to it*/

ods noproctitle;
ods graphics / imagemap=on;

proc corr data=SASHELP.IRIS nosimple noprob pearson outp=work.Corr_stats plots=matrix(histogram 
		nvar=4 nwith=4);
	var PetalWidth;
	with SepalLength SepalWidth PetalLength;
run;
/* - nosimple: suppresses descriptive summary statistics
   - noprob: suppresses p-values associated with the hypothesis test that 
   	  H0: Pearson correlation coefficient = 0 versus 
      Ha: Pearson correlation coefficient different from 0
   - pearson requests Pearson correlation coefficient 
   - Pearson correlation coefficient corresponds to the default 
and will be displayed unless we specify other options such as:
HOEFFDING, KENDALL, SPEARMAN, POLYCHORIC, POLYSERIAL, 
OUTH=, OUTK=, or OUTS= option. 
   - If a scatter plot or a scatter plot matrix is requested, 
the Pearson correlations will be displayed. 
   */

/* Simpler Code */
/**Obtain scatterplots within Proc Corr **/
proc corr data=sashelp.iris plots=scatter(ellipse = none);
var PetalWidth PetalLength SepalWidth SepalLength;
/* Only use numerical variables to do correlation analysis -- do not use character variables such as Likert scale 
   data even when they are recorded as numerical in SAS
/* Code returns all pairwise correlations */
/* Need to include scatterplots to confirm that the relationship is indeed linear */
run;

/*Creating scatter plots with many more options*/
/* Link to SAS online documentation: 
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/grstatproc/p0lfzklhx36ylln1t9sssgzuf64m.htm
*/

proc sgscatter data=sashelp.iris;
plot PetalWidth*(PetalLength SepalLength SepalWidth)
/ group=species; /* group color codes data according to species */
run;
/* Notice positive relationship between Petalwidth and Sepalwidth
for two of the species (Virginica and Versicolor) but not the third (Setosa)*/


/* Analysis by Species */
proc sort data=sashelp.iris out=work.iris;
by species;
run;

proc corr data=work.iris plots=scatter;
var PetalWidth SepalWidth;
by species;
run;

/* Versus */
proc corr data=sashelp.iris plots=scatter;
var PetalWidth SepalWidth;
run;

/* Preparation for multiple linear regression :
In MLR, we always have to interpret the relationship between the response and 
some explanatory variable GIVEN (accounting for the effect of) the other explanatory
variables.
*/
proc corr data=sashelp.iris plots = scatter;
var PetalWidth SepalWidth;
partial SepalLength PetalLength;
/* A partial correlation measures the strength of the LINEAR relationship between 
2 variables, while adjusting for the effect of other variables. */
run;