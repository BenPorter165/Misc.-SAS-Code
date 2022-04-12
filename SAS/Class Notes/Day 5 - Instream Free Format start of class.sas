
AMC Concord 22 2930 4099
AMC Pacer   17 3350 4749
AMC Spirit  22 2640 3799
Buick Century 20 3250 4816
Buick Electra 15 4080 7827



/*Run the following code and observe 
the rows in the output data set */

Robin 3 2 5 1 6
Jack 4 4 4 3 4
Tim 3 0 0
Martin 1 0 1 1
Caroline 2 3 4 5 6


proc print data = reading;
	title 'Summer Reading Program';
	var Name Week1-Week5;
run;

/**MISSOVER statement**/
/**missing values are at the end of a record**/


Robin 3 2 5 1 6
Jack 4 4 4 3 4
Tim 3 0 0
Martin 1 0 1 1
Caroline 2 3 4 5 6


PROC PRINT data = reading;
	title 'Summer Reading Program';
	var Name Week1-Week5;
RUN;



/**DSD statement**/
/**missing values are at the beginning or middle of a record**/

Robert,,A,C,A,D
William,B,C,A,D,A
Linda,C,B,,A,C
Lisa,D,D,D,C,A
Katherine,A,B,C,D,A


proc print data = survey;
	title 'Survey Results';
	var Name Q1-Q5;
run;

/**
- add length statement to correctly display 'Katherine' 
  length Name $ 9;
- what if we had blank spaces between the data values?
- the DSD option can also be used 
i) when there is a missing value at the beginning of a record, and
ii) when the data are delimited by blanks 
(in conjunction with the DLM= option) 
**/


Robert  A C A D
William B C A D A
Linda C B  A C
 D D D C A
Katherine A B C D A


proc print data = survey;
	title 'Survey Results';
	var Name Q1-Q5;
run;




Robert  A C A 
William B C A D A
Linda C B  A C
 D D D C A
Katherine A B C D A




