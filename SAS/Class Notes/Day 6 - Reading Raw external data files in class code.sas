/*
We mostly practiced to read data sets of various formats into SAS
The ease of reading in data sets using SAS Studio's function 'New Import Data'
depends on the format type and the structure of the data set.

Check if the data set includes variable names or not
if there are missing values 
if you have 'non-standard' data such as dates or currency
*/

/*First data set: Consumer Preferences.xlsx */
/*double-click the file "Consumer Preferences.xlsx" */
/*submit the code that gets generated automatically */
/*this is the code:*/

%web_drop_table(WORK.IMPORT);

FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/Consumer Preferences.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT; /*save the data set in the work 
						library and call it 'import' */
	GETNAMES=YES; /*Tell SAS to interpret the first line of data 
					as the input variables*/
RUN;
PROC CONTENTS DATA=WORK.IMPORT; RUN;

%web_open_table(WORK.IMPORT);


/* JMP data set: Australian Tourism.jmp */
/*double-click the file "Australian Tourism.jmp" */
/*submit the code that gets generated automatically */
/*this is the code:*/


%web_drop_table(WORK.IMPORT1);

FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/Australian Tourism.jmp';
PROC IMPORT DATAFILE=REFFILE
	DBMS=JMP /*SAS recognizes the JMP format*/
	OUT=WORK.IMPORT1; /*SAS also knows that JMP files always have variable 
	                   names in the spreadsheet*/
RUN;
PROC CONTENTS DATA=WORK.IMPORT1; RUN;

%web_open_table(WORK.IMPORT1);

/*We noticed issues when reading in .dat and .txt files*/
/*We will come back to these types*/



/* .CSV data set: cholesterol.csv */
/*double-click the file "cholesterol.csv" */
/*submit the code that gets generated automatically */
/*this is the code:*/

%web_drop_table(WORK.IMPORT2); /*I changed the name to IMPORT2*/

FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/cholesterol.csv';
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT2;
	GETNAMES=YES;
RUN;
PROC CONTENTS DATA=WORK.IMPORT2; RUN;

%web_open_table(WORK.IMPORT2);


/*****************************************/
/*******INFORMATS and FORMATS*************/
/*****************************************/
/*see handout posted in Canvas*/


FILENAME temp3 '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/temp3.dat';

DATA sampledata;
	INPUT  date1 $ 2-9  date2 $ 11-20; /*best guess based on what we know*/
	datalines;
	20-07-19 20-07-2019 
	;
RUN; /*will display the dates but SAS does not recognize these as actual dates*/

/*SAS requires in informat statement: ddmmyy8. and ddmmyy10. */
DATA sampledata;
	INPUT @2 date1 ddmmyy8. @11 date2 ddmmyy10.; /*tells SAS how 
	                                           to interpret the date when
	                                           reading it in*/
	datalines;
	04-12-10 31-08-2013 
	;
RUN; /*SAS properly interprets the dates -- you should see 18600 and 19601 
as the values in the data set
However, SAS now displays the dates as values that represent the number 
of days between January 1, 1960 and 04-12-10 & 31-08-2013
*/

/*Tell SAS to write out the date using the common notation instead of 
integer values*/
DATA sampledata;
	INPUT @2 date1 ddmmyy8. @11 date2 ddmmyy10.; /*tells SAS how 
	                                           to interpret the date when
	                                           reading it in*/
	format date1 ddmmyy8. date2 ddmmyy10.; /*tells SAS how to write 
	                                        the date */
	datalines;
	04-12-10 31-08-2013 
	;
RUN;


