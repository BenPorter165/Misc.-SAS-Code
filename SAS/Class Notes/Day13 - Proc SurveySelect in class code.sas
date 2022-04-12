
/* Adjust accordingly */
libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";

/*Taking a simple random sample of size n */
/* without replacement - each observation (not data value!) can only show up once 
   in the drawn sample */
  
proc surveyselect data=methods.safety 
                  sampsize=15 /*n=15 works also*/
                  method= srs  /*simple random sample without replacement*/
                  out=work.safety_srs /*specifies output data set*/
                  seed = 484584; /*setting a seed is helpful for 
                     reproducibility specifies a single initial seed value 
                     for random number generation. To initialize random number 
                     generation, the value must be a positive integer */
                     
                     
run;                  

/*although different data sets can result in the same summary statistics, the probabilty
of this to happen reduces the more numerical summary statistics we ask for and the larger
the data set gets 
- using the same seed will result in the same data set and we all should get identical
numerical summary statistics 
*/
proc means data=work.safety_srs min q1 median mean var q3 max;
var unsafe size weight;
run;

/*simple random sample with replacement*/
/* with replacement - each observation can be sampled repeatedly */
proc surveyselect data=methods.safety 
				  samprate= 0.2
				  method = urs /*unrestricted random sample ; we can sample
				                observations with replacement -- an observation can
				                be sampled more than once */
				  out=work.safety_urs
				  seed = 484584;
run;


/* Taking a stratified random sample */
/* Needed when it is important to have equal 
   representation of categories in the data when these categories
   appear in the original data set at different rates */

proc freq data=methods.ameshousing3;
table central_air* house_style;
run;
/* out of the 300 houses only 42 (14%) don't have central air */


/*stratify by central_air = equal representation
of houses with and without central air in our random sample*/

/*sort by the variable specified in the strata statement*/
proc sort data=methods.ameshousing3;
by central_air;
run;


proc surveyselect data=methods.ameshousing3
                  sampsize= 10 /*10 houses with and 10 without
                                 central air */
                  method = srs /*without replacement */
                  seed = 484584
                  out=work.ameshousing_sub;
strata central_air ; 
run;

/*If we don't stratify te resulting simple random sample 
will have only one house that has no central air */

proc surveyselect data=methods.ameshousing3
                  sampsize= 20 
                  method = srs /*without replacement */
                  seed = 484584
                  out=work.ameshousing_sub;
run;