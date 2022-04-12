/**
set up mylib
**/
data mylib.departures;
input Country $ 1-9 CitiesInTour 11-12 USGate $ 14-26 ArrivalDepartGates $ 28-48;
datalines;
Japan      5 San Francisco          Tokyo, Osaka
Italy      8 New York               Rome, Naples
Australia 12 Honolulu           Sydney, Brisbane
Venezuela  4 Miami            Caracas, Maracaibo
Brazil     4               Rio de Janeiro, Belem
;
run;

proc print data=mylib.departures;
   title 'Data Set AIR.DEPARTURES';
run;

data temp; /*data set is temporarily stored in the WORK library*/
input subjid 1-4  gender $ 6 height 8-9 weight  11-13;
datalines;
1024 1 65 125
1167 1 68 140
1168 2 68 190
1201 2 72 190
1302 1 63 115
;
run;

PROC PRINT data=temp1;
  title 'Output dataset: TEMP1';
RUN;

/**EXTRA**/
/**Truncover**/
/**
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/basess/n1e9v73qmkc54wn1gpqel7qlo8jw.htm
**/


data mylib.arttours;
   input City $ 1-9 Nights 11 LandCost 13-16 NumberOfEvents 18 
         EventDescription $ 20-36 TourGuide $ 38-45 
         BackUpGuide $ 47-54;
Datalines;
Rome      3 1550 7 4 M, 3 G          D'Amico  Torres
Brasilia  8 3360 6 5 M, 1 other      Lucas    Lucas
London    6 2460 5 3 M, 2 G          Wilson   Lucas
Warsaw    6    . 8 5 M, 1 G, 2 other Lucas    D'Amico
Madrid    3  740 5 3 M, 2 other      Torres   D'Amico
Amsterdam 4 1160 6 3 M, 3 G                   Vandever
;
run;

proc print data=mylib.arttours;
   title 'Data Set MYLIB.ARTTOURS';
run;




