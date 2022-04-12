/********************************************/
/*******************OBJECTIVE****************/
/******Read in data file called sales.csv****/
/********************************************/


/************OPTION 1****************/

/*Double-click the files sales.csv 
and copy and paste the generated below*/

%web_drop_table(MyLib.SALES);
/*Specifying the name and location of the file 
we want SAS to read in the PROC IMPORT procedure */
FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv';

PROC IMPORT DATAFILE=REFFILE /*note that there is no ; until 
                             after the REPLACE statement */
	DBMS=CSV  /*tells SAS the type of file */
	OUT=Mylib.SALES /*location where SAS will store the file & its name*/
	REPLACE; /*Replace data set if one already exists in the 
	         same location with same name */
	GETNAMES=YES; /*Implies that SAS assumes the first row 
				 contains the variable names */
RUN;

PROC CONTENTS DATA=MyLib.SALES; RUN; /*Good habit to 
				inspect your data set, sample size & variables */
%web_open_table(MyLib.SALES);


/**We need to change GETNAMES=YES; to GETNAMES=NO; 
as the data set does not come with variable names.
You can always double-check by opening the data file as
a textfile in SAS Studio
**/


FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv';

PROC IMPORT DATAFILE=REFFILE 
	DBMS=CSV 
	OUT=MyLib.SALES 
	REPLACE; 
	GETNAMES=NO;         
	DATAROW=10; /*often not need but this is an option*/			
RUN;

PROC CONTENTS DATA=MyLib.SALES; RUN;

/*Look at the generic variable names; we can change these names */

proc datasets library=MyLib nolist nodetails;
    modify SALES; /*data set in the MyLib library 
    				that we want to edit */
     rename  
      var1=Employee_ID  /*current name = new name*/
      var2=First
      var3=Last
      var4=sex
      var5=Salary
      var6=Job_Title
      var7=country
      var8=birth_date
      var9=hire_data
     ;
quit; /*tells SAS we are done with the modification*/


/************OPTION 2****************/
/* read in the data using a DATA STEP */
/*based on what we have learned thus far */
data MyLib.sales;
   infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv" dlm=','; 
   input Employee_ID $ 
   		 First_Name  $12.
   		 Last_Name  $18.
		 Gender $
		 Salary  
		 Job_Title $25.
		 Country  $
         Birth_Date  date.  /*11AUG1973*/
         Hire_Date mmddyy. ;  /*06/01/1993*/
         label Job_Title='Sales Title' Hire_Date='Date Hired';
   format Salary dollar12.
          Birth_Date mmddyy.
          Hire_Date  monyy7. ;
run;

/*
DATA STEP: The colon (:) modifier allows you to read 
nonstandard data values and character values that are 
longer than eight characters, but which have no embedded
blanks.


nonstandard data: is data that can be read only with 
the aid of informats. 
Examples of nonstandard data include numeric values that contain 
commas, dollar signs, or blanks; character variables that 
contain embedded blanks, date and time values; 
and hexadecimal and binary values.
Examples: numeric values that contain commas, 
dollar signs, or blanks; date and time values; 
and hexadecimal and binary values
*/

data work.sales;
   infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv" dlm=','; 
   input Employee_ID 
   		 First_Name :$12.
   		 Last_Name  :$18.
		 Gender :$1.
		 Salary 
		 Job_Title  :$25.
		 Country  :$2.
         Birth_Date  :date.
         Hire_Date :mmddyy.;
         label Job_Title='Sales Title' Hire_Date='Date Hired';
   format Salary dollar12.
          Birth_Date  mmddyy.
          Hire_Date monyy7.;
run;

 
/* missover and dsd are necessary options to add when missing observations 
might be present. */


data phone;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/phone.csv' dlm=',' missover dsd;
input name   land_phone   cell_phone  ;
run; /*results in error reading in the data*/


data phone;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/phone.csv' dlm=',' missover dsd;
input name $ land_phone $ cell_phone $;
run; /*still will result in error reading in the data*/


/*length statement has to come prior the infile and input statement 
If you indicate in the length statement which variables are character 
variables you no longer will have to do so in the input statement.  
*/
data phone;
length Name $25. land_phone $15.  cell_phone $15.;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/phone.csv' dlm=',' missover dsd;
input name  land_phone  cell_phone ;
run; 
 
/*colon modifier to read in the data*/
data phone;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/phone.csv' dlm=',' missover dsd;
input name :$25. land_phone :$15. cell_phone :$15.;
run;  
 
 
 
/*
CAUTION

- Be careful in shortening the length of numeric variables if your variable 
values are not integers. Fractional numbers lose precision permanently if 
they are truncated. In general, use the LENGTH statement to truncate values 
only when disk space is limited. 
Use the default length of 8 bytes to store variables containing fractions.


- When you create character variables, SAS determines the length of 
the variable from its first occurrence in the DATA step. Therefore, 
you must allow for the longest possible value in the first statement 
that mentions the variable. If you do not assign the longest value 
the first time the variable is assigned, then data can be truncated.
*/
