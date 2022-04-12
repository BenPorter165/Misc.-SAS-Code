/*.dat file: opening the .dat file in a text editor shows that data points 
are separated by the following delimiter: * .  Thus, dlm="*" is the proper option.*/

data pricing;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/pricing.dat' dlm='*';
input ProductID StartDate :date. Enddate :date. Cost :dollar. SalesPrice :dollar.;
format StartDate Enddate mmddyy9. Cost SalesPrice dollar8.2 ;
run;
/*Note the colon symbol : at the beginning of the informats (:date.), these are 
necessary in order for the data to be read in properly.   */


/* missover and dsd are necessary options to add when missing observations 
might be present. */

data onionring;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/OnionRing.dat' dlm=' ';
input VisitingTeam $ 1-20 CSales 21-24 BSales 25-28
         OurHits 29-31 TheirHits 32-34 OurRuns 35-37 TheirRuns 38-40;
run;
