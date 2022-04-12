DATA sales;
	INFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/OnionRing.dat';
	INPUT VisitingTeam $ 1-20 CSales 21-24 BSales 25-28 OurHits 29-31 TheirHits 
		32-34 OurRuns 35-37 TheirRuns 38-40;
RUN;


FILENAME temp3 '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/temp3.dat';

DATA sampledata;
	INPUT  date1 $ 2-9  date2 $ 11-20;
	datalines;
	20-07-19 20-07-2019 
	;
RUN;

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


