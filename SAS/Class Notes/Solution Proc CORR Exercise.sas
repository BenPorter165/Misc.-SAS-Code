libname methods '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets';


/* Generate scatter plots and correlations for the VAR variables 
   Age, Weight, Height, and the circumference measures versus the 
   WITH variable, PctBodyFat2.
*/

/* proc corr will create individual scatterplots 
for each explanatory variable with the response variable.
It does this for 10 variables at a time so we will need
two proc corr statements
*/
ods graphics / reset=all imagemap;
proc corr data=methods.BodyFat2
plots(only)=scatter(nvar=all ellipse=none);
var Age Weight Height Neck Chest Abdomen Hip
Thigh Knee Ankle; /*Only 10 variables at a time allowed*/
with PctBodyFat2;
title "Correlations and Scatter Plots";
title1 'Age, Weight, Height, Neck, Chest, Abdomen, Hip,
Thigh, Knee, Ankle with PctBodyFat2';
run;

proc corr data=methods.BodyFat2
plots(only)=scatter(nvar=all ellipse=none);
var Biceps Forearm Wrist; 
with PctBodyFat2;
title "Correlations and Scatter Plots";
title1 'Biceps, Forearm, Wrist with PctBodyFat2';
run;

/* Can straight lines adequately describe the relationships? */
/* Answer: Most of the relationships appear linear and positive */


/* Are there any outliers that you should investigate? */

/* Although the SAS online documentation includes an ID statement 
   in Proc Corr the statement does not work and will not be helpful 
   to identify some of the outliers by Case number. 
   Let's use Proc SGSCATTER instead.
*/

proc sgscatter data=methods.BodyFat2;
plot PctBodyFat2*(Age Weight Height Neck) /datalabel=case;
run;

proc sgscatter data=methods.BodyFat2;
plot PctBodyFat2*(Chest Abdomen Hip
Thigh) /datalabel=case;
run;

proc sgscatter data=methods.BodyFat2;
plot PctBodyFat2*(Knee Ankle Biceps) /rows=1 datalabel=case;
run;

proc sgscatter data=methods.BodyFat2;
plot PctBodyFat2*( Forearm Wrist) /datalabel=case;
run;

/* Answer: cases 39, 41 and 216 show up repeatedly. 
           The influence of these three cases likely differs 
           and requires further investigation.
*/

/* What variable has the highest correlation with PctBodyFat2? */
/* Answer: Abdomen: 0.81343, p-value <.0001 the correlation is 
		   statistically significant at 0.05 level of significance*/



/* Generate correlations among all of the variables in the previously 
   mentioned variables minus PctBodyFat2. Select only the highest five 
   per variable. Are there any notable relationships?
*/
ods noproctitle;
ods graphics / imagemap=on;
proc corr data=methods.BodyFat2 best=5 nosimple pearson plots=none out=pearson;
var Age Weight Height Adioposity Neck Chest Abdomen Hip Thigh
Knee Ankle Biceps Forearm Wrist;
run;

/* Answer: Weight has a high correlation with nearly every other 
           variable. Hip also is correlated with most variables. */

/* Advanced: (Advanced) Output the correlation table into a data set. 
             Print out only the correlations whose absolute values are 
             0.70 and above or note them with an asterisk in the full 
             correlation table.*/
            
/* Answer: I'll present two different solutions -- I would not expect 
           you to come up with these. These are advanced and are FYI */ 
          
/* Solution 1: */

%let big=0.7;
%let interval=Age Weight Height Neck Chest Abdomen Hip Thigh
Knee Ankle Biceps Forearm Wrist;

proc format;
picture correlations &big -< 1 = '009.99' (prefix="*")
-1 <- -&big = '009.99' (prefix="*")
-&big <-< &big = '009.99';
run;

proc print data=pearson;
var _NAME_ &interval;
where _type_="CORR";
format &interval correlations.;
run;          

/* Solution 2: */

%let big=0.7;

data bigcorr;
set pearson;
retain row 1;
array vars{*} &interval;
do i=1 to dim(vars);
if i>row or abs(vars{i})<&big then vars{i}=.;
end;
if _type_="CORR";
drop i _type_ row;
row=row+1;
output;
run;

proc print data=bigcorr;
format &interval 5.2;
run;
