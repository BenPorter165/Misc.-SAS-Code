*Analyses based on data file patients.txt stored under 
/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets;

*Use 'Read-in-patients-txt-file.sas' to read in the data;
*Safe this program filename.sas in a folder under your SAS Profile;
*The following analyses will illustrate the use of Proc Freq;


/*
***************DATA Preparation***************
Use the FREQ procedure to count unique values and 
determine whether there are duplicates or erroneous 
data values
*/
title 'Number of Levels  for all Variables';
proc freq data=work.patients nlevels;
tables _all_ / noprint ;/* The _ALL_ keyword with the NOPRINT 
						option displays the number of levels  
						for all variables  without displaying 
						frequency counts. */
run;



title 'Frequency Report for Gender, Diagnosis and Adverse Event';
proc freq data=work.patients ;
tables Gender DX AE /nocum nopercent;/*The NOCUM option 
   eliminates the cumulative statistics in the output. 
   The NOPERCENT option eliminates the percentage values in 
   the output.*/
run; 



/*Use a DATA step to check for and output invalid data values.*/
data gender_bad;
   set patients;
   if Gender not in ('F' 'M' ' ') then 
      Output GENDER_bad; /*output ensures that only
      					the "bad" values go into the 
      					gender_bad data set instead of all
      					observations that are in patients*/
	  keep Patno Gender; /*keep only these two variables*/
	 					 /*drop Visit HR SBP DBP Dx AE; 
	 					 is equivalent*/
run; 


/*
***************************************
***************Your Turn***************
***************************************
Create a data table that contains all records of 
patients with a missing or undefined/bad diagnosis.
*/
data dx_bad;
   set patients;
   if dx in ('X' ' ') then 
      Output dx_bad;
	  keep Patno Gender;
run;


/*Clean Data to the extent we can*/

/*Option 1*/
/*create new data set, overwrite gender variable 
where necessary */
data patients_clean;
set patients;
if gender = 'f' then gender ='F';
if gender in ('X' '2') then gender = ' ';
if dx='X' then dx=' ';
run;

/*Option 2*/
/*in order create new variable, delete original variable
and rename newly created variable*/
data patients_clean;
set patients;
if gender = 'f' then gender_clean ='F';
else if gender in ('X' '2') then gender_clean = ' ';
else gender_clean=gender;
if dx='X' then dx_clean=' ';
else dx_clean=dx;
drop dx gender;
rename dx_clean=dx gender_clean=gender;
run;



/*Data are as clean as possible without compromising
reliability */


/*Explore associations between variables involving character 
variables using PROC FREQ */

/*Does an association between Gender and Diagnosis exist?*/
/*This analysis will require multiple steps, most of which 
involve data cleaning - we did this above */

/*Look at frequency distributions and Gender by Dx crosstable*/
title 'Frequency Distributions of Gender and Diagnosis';
title1 'Contingency Table of Gender and Diagnosis';
footnote 'All Tables based on Cleaned Data';
proc freq data=patients_clean;
tables gender dx gender*dx ;
run; 


/*Chi-Square test of Independence testing 
under H0: gender and diagnosis are not associated 
vs.
Ha: gender and diagnosis are associated
*/
title 'Frequency Distributions of Gender and Diagnosis';
title1 'Contingency Table of Gender and Diagnosis';
title2 'Test of Independence';
footnote 'All Tables based on Cleaned Data';
proc freq data = patients_clean;
tables gender dx gender*dx / chisq expected;
run;
/*Consider warning given with the Results*/

/**********************************************************/
/************END Part 1 Proc Freq - Day 3******************/
/**********************************************************/


