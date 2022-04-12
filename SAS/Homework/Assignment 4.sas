%let path=/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Assignments;
        /*  /home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Assignments/medical.txt. */
/**Question 1**/
/**part a) **/

data work.shoes;
infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt" dlm='09'x firstobs=2;
length Region $50. Product $50. Subsidiary $50.;
input  Region  Product Subsidiary	Stores	Sales :dollar12.	Inventory :dollar12.	Returns :dollar12.;
format Sales dollar12.	Inventory dollar12.	Returns dollar12.;
run;

/**part b) **/
proc print data=work.shoes (obs=10) noobs;
run;


/**Question 3**/
/** part a) **/
data work.medical;
   infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Assignments/medical.txt" dlm=' '; 
   input Date :mmddyy. First_Name :$10. Chol_Level Sys_BP Dias_BP;  
		format Date mmddyy9.;
run;

/*alternatively, you can use the path statement to read in the data file*/
data work.medical;
   infile "&path/medical.txt" dlm=' '; 
   input Date :mmddyy. First_Name :$10. Chol_Level Sys_BP Dias_BP;  
		format Date mmddyy9.;
run;

/** part b) **/
proc print data=work.medical (firstobs=5 obs=10);
run;

/** part d) **/
data work.medical;
set work.medical;
if Chol_Level=999 then Chol_Level=.;
if Sys_BP=999 then Sys_BP=.;
if Dias_BP=999 then Dias_BP=.;
run;

/** part e) **/
proc means data=medical nmiss;
var Chol_Level Sys_BP Dias_BP;
run;
/* 2, 1, 1*/

/**Question 4**/
/** part a) **/
data work.hmeqb;
   infile "&path/hmeqb.dat" dlm=',' dsd firstobs=2; 
   input LOAN :dollar. REASON :$12. ID BA;  
		format LOAN dollar9.2; /*note that levels of
		REASON are abbreviated in the original 
		data file*/
run;

/** part b) **/
proc freq data=work.hmeqb;
table REASON;
run;
/*2*/

/**Question 5**/
/** part a) **/
data work.kids6;
   infile "&path/kids6.dat" missover;
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10.  
         hobby3 : $10.;
run;

/** part b) **/
proc print data=work.kids6;
run;
/*Jennifer*/