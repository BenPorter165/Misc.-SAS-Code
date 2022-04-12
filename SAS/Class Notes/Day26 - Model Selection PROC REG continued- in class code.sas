
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

data cdi_subset;
set cdi;
where physicians <10000;
run;
 
/*Visually explore relationships*/ 

/*Create individual scatterplots but do so more efficiently
using a macro:*/

/*generalize as a macro called "graphs" */
%macro graphs(graphsdata, graphsvar1, graphsvar2);
proc sgscatter data=&graphsdata;
plot &graphsvar1*&graphsvar2;
run;
%mend;

/*-look at scatterplots for variables having a weak to strong 
 relationship with physicians 
 */

%graphs(cdi_subset, physicians, tot_pop);
%graphs(cdi_subset, physicians, tot_income);
%graphs(cdi_subset, tot_pop, tot_income);

/*Run Proc Reg using a stepwise slection method: "forward", "backward", "stepwise forward"  */
/*Only include numerical variables*/
proc reg data=cdi_subset;
model physicians = land_area tot_pop pop_young 
 pop_elderly beds crimes hsgrad bsgrad pov unemploy 
 income tot_income / selection=stepwise sle=0.20  sls=0.15;
run;

/*Model 1 based on stepwise selection*/
proc reg data=cdi_subset;
model physicians = land_area tot_pop
                   beds   bsgrad hsgrad
                   income tot_income / vif ;
run;

/*results: remove tot_pop due to collinearity with tot_income, then
refit the model */

/*next step*/
proc reg data=cdi_subset;
model physicians = land_area 
                   beds   bsgrad hsgrad
                   income tot_income / vif ;
run;
/*results: remove land_area with largest p-value*/

/*next step*/
proc reg data=cdi_subset;
model physicians =beds   bsgrad hsgrad
                   income tot_income / vif ;
run;
/*results: remove income with largest p-value*/

/*next step*/
proc reg data=cdi_subset;
model physicians =beds   bsgrad hsgrad
                   tot_income / vif ;
run;
/*results: remaining predictor variables all seem ststistically
significant
however, residual diagnostics suggest concerns with normality of
the residuals and the constant variance assumption*/

/*next step: tranform response using the log function,
later analysis will show we should also transform beds and tot_income 
*/
data new;
set cdi_subset;
logphys=log(physicians);
logbeds=log(beds);
sqbeds=beds*beds;
logtot_income=log(tot_income);
sqtot_income=tot_income*tot_income;
run;

/*next step: rerun last model but use logphysicians as response)*/
proc reg data=new;
model logphys = beds  bsgrad hsgrad
                   tot_income /vif ;
run;

/*results: hsgrad can probably be taken out, beds and tot_income 
show a non-linear relationship now with logphysicians*/

proc reg data=new;
model logphys = logbeds
                   bsgrad
                   income  logtot_income/vif ;
run;
/*results: remove income because p-value is close to 0.05 and we already have 
log_tot_income */

proc reg data=new;
model logphys =  logbeds bsgrad logtot_income/vif ;
run;

/*In class we had kept land_area in the model and it remained signifciant. Let's see what happens 
if we include it back in*/

proc reg data=new;
model logphys =  land_area logbeds bsgrad logtot_income/vif ;
run;

/*I think arguments can be made either way for keeping land_area.
  To keep the model simpler I probably would take it out and keeping only  
  logbeds bsgrad logtot_income */