
/*Reading In Sales Data Set*/

/*Be sure to update your path */
FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv';


PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.SALES;
	GETNAMES=NO;
	DATAROW=1;
RUN;

PROC CONTENTS DATA=WORK.SALES; RUN;


proc datasets library=work nolist nodetails;
    modify SALES;
     rename  
      var1=Employee_ID
      var2=First
      var3=Last
      var4=sex
      var5=Salary
      var6=Job_Title
      var7=country
      var8=birth_date
      var9=hire_date
     ;
quit;


proc print data = sales (obs=10);
run;

/*********Proc Format**************/
/*allows for user-defined formats that are independent
of data sets and can be used across any data set so long 
we have a variable that we want to use the format for */

/*format defined for character variable requires $ at the beginning
of the format name*/

/*create a format for variable 'country' in the sales.csv data set */
proc format;  
value $ctryfmt 'AU'='Australia' 
               'US'='United States'
               other='Miscoded' ; 
run;               

proc means data=sales min max mean var;
class country;
var salary;
format salary dollar12. country $ctryfmt.; /*Be sure to place a . at the 
								end of the format name*/
run;

/*format for numerical variables*/
/*no $ required*/
/*define a format for Tiers for variable salary*/
proc format;
value Tiers 0-49999='Tier 1' 
			50000-99999='Tier 2'
			100000-250000='Tier 3'; /*not the most efficient because
			we miss values between 49,999.01 -- 49,999.99, for example */
run; /*We could easily extend the range for salary but this is not always
possible, eg. for variables with increased precision*/			


proc print data =sales;
var Employee_ID salary;
format salary Tiers.;
run;

/*produces a frequency table using the levels defined by the 
format Tiers */
proc freq data=sales;
table salary;
format salary Tiers.;
run;


/*define a range that can include/exlude a lower or upper bound */
proc format;
value Tiers 0 - < 50000 ='Tier 1' 
			50000 - < 100000 ='Tier 2'
			100000 - 250000='Tier 3';
/*we can define multiple formats in the same proc format statement*/			
value TiersA 0 < - 50000 = 'Tier A1'
             50000 < - 100000 = 'Tier A2';			
run;	

proc freq data=sales;
table salary;
format salary TiersA.;
run;

/*Using the key words 'low' and 'high', SAS will automatically 
identify the smallest observation (min) and largest, respectively*/
proc format ; 
value TiersB low - <50000 = 'Tiers Low'
             50000 - < 100000 = 'Tier Middle' 
             100000- high = 'Tier High';
run;
     
proc freq data=sales;
table salary;
format salary TiersB.;
run;

/****************************************************************/
/****************************************************************/
/**** In-class Quiz ****/
/*
- pick a data set from the SASHELP library that has both quantitative and
character variables
- get a list of all variables */
proc contents data=sashelp.baseball;
run;

/*pick a numerical and character variable with less than 5 levels for 
the character variable to keep the format managable */
proc freq data=sashelp.baseball nlevels;
table CrHits div ;
run;   

/*Note that a proc means statement might be more efficient to get reasonable 
cut-off points for the quantitative variable!!*/


/*
- Define a user-defined format for each variable using the same
proc format statement 

- Use proc freq to display a table of all the levels defined using the
new format:
 
proc freq data=sashelp. ...;
table numvar charvar ;
format numvar my_num_format. charvar my_char_format.;
run;

- Submit SAS code and screeshot in Canvas
*/




