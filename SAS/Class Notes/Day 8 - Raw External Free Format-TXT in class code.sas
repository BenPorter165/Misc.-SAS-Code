/*Import a text file with PROC IMPORT and a SAS DATA STEP*/

/*ods trace on;*/
proc contents data=sashelp.shoes varnum;
ods select Contents.DataSet.Position;
run;
/*ods trace off;*/


/**Example 1**/
proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    out=work.shoes
    dbms=tab;
run;

proc print data=work.shoes (obs=6) noobs;
run;

proc contents data=work.shoes order=varnum;
ods select Contents.DataSet.Position;
run;

proc contents data=SASHELP.shoes order=varnum;
ods select Contents.DataSet.Position;
run;

/*
It seems that the PROC IMPORT procedure has identified correctly 
the type of each variable. However, the DOLLAR12.-format of the 
last 3 columns has been lost. As an alternative, you can use a 
SAS Data Step to import a text file and explicitly specify the 
variable formats.
*/


/*rerun above code and check Log window */
proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    out=work.shoes
    dbms=tab;
run;

/*
 NOTE: Import cancelled.  Output dataset WORK.SHOES already exists.  Specify REPLACE option to overwrite it.
 NOTE: The SAS System stopped processing this step because of errors.
*/

proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    out=work.shoes
    dbms=tab
    replace;
run;


/**Example 2**/
proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-comma.txt"
    out=work.shoes
    dbms=tab
    replace;
    delimiter=",";
run;
 
proc print data=work.shoes (obs=6) noobs;
run;

proc contents data=work.shoes order=varnum;
ods select Contents.DataSet.Position;
run;
/*last 3 columns are character instead of numeric. 
This is because the values in these 
columns were written between double quotes in the input file.*/

/*
You can change the format of the last 3 columns with 
the INPUT statement, 
or use a SAS Data Step to import the text file.
*/

proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-semicolon.txt"
    out=work.shoes
    dbms=tab
    replace;
    delimiter=";";
run;
 
 
proc print data=work.shoes (obs=6) noobs;
run;
proc contents data=work.shoes order=varnum;
ods select Contents.DataSet.Position;
run;
/*
It seems that the PROC IMPORT procedure has identified correctly 
the type of each variable. However, the DOLLAR12.-format of the 
last 3 columns has been lost. As an alternative, you can use a 
SAS Data Step to import a text file and explicitly specify the 
variable formats.
*/


proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-pipe.txt"
    out=work.shoes
    dbms=tab
    replace;
    delimiter="|";
run;
 
 
proc print data=work.shoes (obs=6) noobs;
run;
proc contents data=work.shoes order=varnum;
ods select Contents.DataSet.Position;
run;

/*
It seems that the PROC IMPORT procedure has identified correctly 
the type of each variable. However, the DOLLAR12.-format of the 
last 3 columns has been lost. As an alternative, you can use a 
SAS Data Step to import a text file and explicitly specify the 
variable formats.
*/


proc import file="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-space.txt"
    out=work.shoes
    dbms=tab
    replace;
    delimiter=" ";
run;
 
 
proc print data=work.shoes (obs=6) noobs;
run;
proc contents data=work.shoes order=varnum;
ods select Contents.DataSet.Position;
run;

/*
It seems that the PROC IMPORT procedure has identified correctly 
the type of each variable. However, the DOLLAR12.-format of the 
last 3 columns has been lost. As an alternative, you can use a 
SAS Data Step to import a text file and explicitly specify the 
variable formats.
*/

/*
import a tab-delimited text file with a SAS DATA Step. Note 
that to read a tab-delimited file, you must use DELIMITER=“09”x.
*/
data work.shoes1;
infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    delimiter = '09'x
    missover 
    dsd
    firstobs=2; /*data begin line 2 */
    
    informat Region $50.;
    informat Product $50.;
    informat Subsidiary $50.;
    informat Stores best12.;
    informat Sales dollar12.;
    informat Inventory dollar12.;
    informat Returns dollar12.;
 
    format Region $50.;
    format Product $50.;
    format Subsidiary $50.;
    format Stores best12.;
    format Sales dollar12.2;
    format Inventory dollar12.2;
    format Returns dollar12.2;
 
    input
    Region $
    Product $
    Subsidiary $
    Stores
    Sales
    Inventory
    Returns;
run;
 
proc print data=work.shoes1 (obs=6) noobs;
run; 
proc contents data=work.shoes1 order=varnum;
ods select Contents.DataSet.Position;
run;
