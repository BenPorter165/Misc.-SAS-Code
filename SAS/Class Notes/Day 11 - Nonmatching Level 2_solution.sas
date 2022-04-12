/** Solution to Level 2 Exercise **/
/** Merging Data Sets with Nonmatches **/

/* part a) */

proc sort data = orion.customer out=work.customer;
by Country;
run;

/* part b) */

data work.allcustomer;
length country $50.;
merge work.customer orion.lookup_country (rename=(Start=Country Label=Country_Name));
by Country;
keep customer_id country customer_name country_name;
run;

/* part c) */

proc print data=work.allcustomer;
run;
/*Note that I get the Error message in the Log below*/
/*This is most likely due to observation 80 and could be 
an artifact of me using a mac or switching back and forth between
PC and Mac */


/*
ERROR: Invalid characters were present in the data.
 ERROR: An error occurred while processing text data.
 
 NOTE: The SAS System stopped processing this step because of errors.
 NOTE: There were 308 observations read from the data set WORK.ALLCUSTOMER.
 NOTE: PROCEDURE PRINT used (Total process time):
       real time           0.12 seconds
       user cpu time       0.13 seconds
       system cpu time     0.01 seconds
       memory              2836.15k
       OS Memory           33960.00k
       Timestamp           09/28/2021 09:05:54 PM
       Step Count                        278  Switch Count  0
       Page Faults                       0
       Page Reclaims                     293
       Page Swaps                        0
       Voluntary Context Switches        0
       Involuntary Context Switches      1
       Block Input Operations            0
       Block Output Operations           24
*/

/* part d) */

data work.allcustomer;
length country $50.;
merge work.customer (in=Cust) 
      orion.lookup_country (rename=(Start=Country Label=Country_Name) in=Cntry);
by Country;
if Cust=1 and Cntry=1;
keep customer_id country customer_name country_name;
run;

