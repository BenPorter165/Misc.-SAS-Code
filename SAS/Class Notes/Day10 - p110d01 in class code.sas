********** Create Data **********;
data empsdk;
   input First $ Gender $ Country $;
   datalines;
Lars    M   Denmark
Kari    F   Denmark
Jonas   M   Denmark
;

data empsfr;
   input First $ Gender $ Country $;
   datalines;
Pierre  M   France
Sophie  F   France
;

/*** Like-Structured Data sets ***/

data empsall;
 set empsdk empsfr; /*we could combine more than 2*/
run;



