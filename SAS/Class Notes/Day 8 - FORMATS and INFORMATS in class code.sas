/*FORMATS and INFORMATS*/
/*default settings for informats and formats are the shorter versions 
So, ":mmddyy." will operate the same way as ":mmddyy8." */



DATA sampledata;
	INPUT @2  date1   mmddyy.   /*does not work at all*/
	      @13 date2   mmddyy8.  /*works as long as you use yy and not yyyy*/
	      @24 date3   mmddyy10. /*always works except for 4DEC2010-format*/
          @35 date4  :mmddyy.   /*always works except for 4DEC2010-format*/
	      @46 date5  :mmddyy8.  /*always works except for 4DEC2010-format*/
	      @57 date6  :mmddyy10. /*always works except for 4DEC2010-format*/
	      ;             
/*uncomment the format code in lines 16-22 to see the dates properly formatted*/
/*	format date1 mmddyy. 
	       date2 mmddyy8. 
	       date3 mmddyy10. 
	       date4 mmddyy.
	       date5 DDMMYYD10.
	       date6 DOWNAME.
	       ; */
	datalines;
	04-12-10   04-12-10   04-12-10   04-12-10   04-12-10   04-12-10
	04-12-2010 04-12-2010 04-12-2010 04-12-2010 04-12-2010 04-12-2010
	04/12/10   04/12/10   04/12/10   04/12/10   04/12/10   04/12/10
	04/12/2010 04/12/2010 04/12/2010 04/12/2010 04/12/2010 04/12/2010
	4DEC2010   4DEC2010   4DEC2010   4DEC2010   4DEC2010   4DEC2010
	;
RUN;

/*The "date." format and informat is designed to read in data of the following 
shape: 4DEC2010  */
DATA sampledata;
	INPUT @2  date1   date. 
	      @13 date2   date7.
	      @24 date3   date9. 
	      @35 date4  :date.
	      @46 date5  :date7. 
	      @57 date6  :date9. 
	      ; 
/*uncomment the format code in lines 16-22 to see the dates properly formatted*/
/*
 	format date1 date. 
	       date2 date7. 
	       date3 date9. 
	       date4 date.
	       date5 date7.
	       date6 date9.
	       ; */
	datalines;
	04-12-10   04-12-10   04-12-10   04-12-10   04-12-10   04-12-10
	04-12-2010 04-12-2010 04-12-2010 04-12-2010 04-12-2010 04-12-2010
	04/12/10   04/12/10   04/12/10   04/12/10   04/12/10   04/12/10
	04/12/2010 04/12/2010 04/12/2010 04/12/2010 04/12/2010 04/12/2010
	12APR2010  12APR2010  12APR2010  12APR2010  12APR2010  12APR2010
	;
RUN;


/*pay attention to the difference between 
the informat for "n1" and "n2" due to the : modifier! */
data name;
   informat FirstName $15. LastName $15. n1 6.2 n2 :7.3;
   input firstname lastname n1 n2;
   datalines;
Alexander Robinson 35 11
;
proc print;
run;

/*replace the informat statement with the length statement*/
/*observe the displayed values of "n1" and "n2"*/
data name;
   length firstname $15. lastname $15. n1 6.2 n2 7.3 ;
   input firstname lastname n1  n2;
   datalines;
Alexander Robinson 35 11
;
proc print;
run;

