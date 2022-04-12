/*Question 1*/
/*part (b)*/
data europeancars;
set sashelp.cars;
run;
/*428 observations and 15 variables*/

/*part (c)*/
proc contents data=europeancars;
run;
/*5 character and 10 numerical*/

/*part (d)*/
proc print data=europeancars (obs=5);
var make type origin drivetrain msrp;
run;
/*screenshot*/

/*part (e)*/
data europeancars_SUVs;
set sashelp.cars;
where type="SUV";
run;
/*60 observations*/

/*part (f)*/
data europeancars_SUVs_Asia;
set sashelp.cars;
where type="SUV" and origin="Asia" ;
run;
/*25 observations*/
/*alternative solutions that all display the sample
size in either the log window or the output:
*/
/*option 1*/
data europeancars_SUVs_Asia;
set europeancars_SUVs;
where origin="Asia" ;
run;
/*option 2*/
proc print data=europeancars_SUVs;
where origin="Asia";
run;
/*option 3*/
proc means data=europeancars_SUVs;
where origin="Asia";
run;


/*part (g)*/
data europeancars;
set sashelp.cars;
where type="SUV" and make in('Hummer', 'BMW', 'Toyota');
run;
/*8 observations: 5 Toyota, 2 BMW, 1 Hummer*/
/*alternative solutions that all display the sample
size in either the log window or the output:
*/
/*option 1*/
data europeancars_SUVs_HBT;
set europeancars_SUVs;
where make in('Hummer', 'BMW', 'Toyota');
run;
/*option 2*/
proc means data=europeancars_SUVs;
where make in('Hummer', 'BMW', 'Toyota');
run;
/*option 3*/
proc print data=europeancars_SUVs;
where make in('Hummer', 'BMW', 'Toyota');
run;


/*part (h)*/
data europeancars;
set sashelp.cars;
where type="SUV" and msrp between 45000 and 55000;
run;
/*9 observations, alternative options similar
to the ones above*/
/*for example*/
proc means data=europeancars_SUVs;
where msrp between 45000 and 55000;
run;

/*part (i)*/
proc means data=europeancars_SUVs min mean median max;
var msrp;
run;

/*
Minimum: $17,163.00
Mean: $34,790.25
Median: $32,062.50
Maximum: 76,870.00
*/


/*Question 2*/

/** FOR CSV Files uploaded from Windows **/

FILENAME CSV "<Your CSV File>" TERMSTR=CRLF;

/** FOR CSV Files uploaded from Unix/MacOS **/

FILENAME CSV "/home/ulrike1/My_SAS_Programs/Stat 484-584-F21/Homework/muscle.csv";

/** Import the CSV file.  **/

PROC IMPORT DATAFILE=CSV
		    OUT=WORK.MYCSV
		    DBMS=CSV
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.MYCSV (obs=3); RUN;

/** Unassign the file reference.  **/

FILENAME CSV;
