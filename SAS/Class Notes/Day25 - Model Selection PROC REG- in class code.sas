/*We'll start out doing model selection using PROC REG 
  PROC REG allows for model selection but can only handle 
  numerical variables. 
  PROC GLM, which allows for character variables, does not have 
  a model selection feature => PROC GLMSELECT (next class)
 */
 
/*data set CDI.txt with the goal to predict number of active physicians 
 in a county by population characteristics*/
 
 data cdi;
 infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/CDI.txt';
 input id county $ state $ land_area tot_pop pop_young 
 pop_elderly physicians beds crimes hsgrad bsgrad pov unemploy 
 income tot_income region;
 run;
/* in order as in the input statement:
- ID-Variable, - County, - State, - Land Area, - Total Population (estimated), 
- Percent of Pop. Age 18-34, - Percent of Pop. Age 65 or older,
- # of Active Physicians, - Number of Hospital Beds, - Total Serious Crimes,
- Percent of Adult Population HS Grads,
- Percent of Adult Population with BS degree,
- Percent Population below poverty level income,
- Percent Unemployment,
- Per capita Income,
- Total personal income,
- Geographic region by Census Buero (1=NE, 2=NC, 3=S, 4=W)
*/ 
 
/*Two of the counties have > 15,000 physicians while the next
largest county has 7,553 => exclude these two extreme cases */

proc univariate data=cdi ;
var physicians;
ods select ExtremeObs;
run;

 
data cdi_subset;
set cdi;
where physicians <10000;
run;
 
/*Visually explore relationships*/ 
/*these may not be easy to read */ 
proc sgscatter data= cdi_subset;
matrix physicians tot_pop pop_young pop_elderly ;
run;
proc sgscatter data= cdi_subset;
matrix physicians land_area beds crimes;
run;
proc sgscatter data= cdi_subset;
matrix physicians hsgrad bsgrad pov;
run;
proc sgscatter data= cdi_subset;
matrix physicians unemploy income tot_income;
run;

/*Create individual scatterplots but do so more efficiently
using a macro:*/
/*Scatterplot of interest*/
proc sgscatter data=cdi_subset;
plot physicians*beds;
run;

/*generalize as a macro called "graphs" */
%macro graphs(graphsdata, graphsvar1, graphsvar2);
proc sgscatter data=&graphsdata;
plot &graphsvar1*&graphsvar2;
run;
%mend;

/*-look at scatterplots for variables having a weak to strong 
 relationship with physicians 
 */

%graphs(cdi_subset, physicians, land_area)
%graphs(cdi_subset, physicians, tot_pop)
%graphs(cdi_subset, physicians, pop_young)
%graphs(cdi_subset, physicians, pop_elderly)
%graphs(cdi_subset, physicians, beds)
%graphs(cdi_subset, physicians, crimes)
%graphs(cdi_subset, physicians, hsgrad)
%graphs(cdi_subset, physicians, bsgrad)
%graphs(cdi_subset, physicians, pov)
%graphs(cdi_subset, physicians, unemploy)
%graphs(cdi_subset, physicians, income)
%graphs(cdi_subset, physicians, tot_income)
%graphs(cdi_subset, physicians, region);
%graphs(cdi_subset, pov, income);
quit;

/*identify:  tot_pop crimes beds tot_income as having a linear 
relationship with physicians */
  
proc corr  data = cdi_subset;
var land_area tot_pop pop_young 
 pop_elderly beds crimes hsgrad bsgrad pov unemploy 
 income tot_income region; /*shows are few more variables with
                   significant correlations that are not very
                   obvious in the scatterplots (point density 
                   can affect interpreation)*/
with physicians ;
run; 
 
/*
- intercorrelations between the predictor variables that have a significant
relationship with physicians 
*/

proc corr data = cdi_subset;
var tot_income income tot_pop pop_young beds crimes bsgrad unemploy;
run;
%graphs(cdi_subset, tot_income, tot_pop);
%graphs(cdi_subset, tot_income, crimes);
/*Because some of these explanatory variables are correlated 
we will likely encounter multicollinearity if we include all
into the same model */

/*Run PROC REG using different model selection methods (forward, backward 
and stepwise) and 
 model fit criteria (R-squared, SSE, Adjusted R-squared, MSE, Mallow's Cp
 AIC/SBC, PRESS statistic)*/

proc reg data = cdi_subset ;
 model physicians = tot_income income tot_pop land_area
                    pop_elderly beds crimes bsgrad hsgrad
                    region pov unemploy / 
                    selection = rsquare adjrsq cp aic bic
                    b best = 3;
                    run;

/*7 variable model chosen by most*/ 
proc reg data = cdi_subset;
model physicians = tot_income  income  tot_pop land_area beds bsgrad
hsgrad / vif;
run; 
/* remove tot_pop because of the high correlation with tot_income 
 and large VIF */
 
proc corr data = cdi_subset;
var income land_area beds bsgrad
hsgrad;
with physicians;
partial tot_income;
run;
/* remove income */  

proc reg data = cdi_subset;
model physicians = tot_income land_area beds bsgrad
hsgrad / vif;
run;
/*remove land_are - no longer significant */

/*top 3-variable model*/
proc reg data = cdi_subset;
model physicians = tot_income tot_pop beds 
/ vif;
run;
/*will also require removal of either tot_income or tot_pop*/
