********** Create Data **********;
data empscn;
   input First $ Gender $ Country $;
   datalines;
Chang   M   China
Li      M   China
Ming    F   China
;

data empsjp;
   input First $ Gender $ Region $;
   datalines;
Cho     F   Japan
Tomi    M   Japan
;


/*** Unlike-Structured Data Sets ***/

data empsall2;
 set empscn empsjp;
run;
/*bc of the different variables names, SAS created 
two variables: Country and Region resulting in missing
observation for the variable that is not part of 
the original data set*/

/*rename one of the two variables that measure the same*/
data empsall2;
 set empscn (rename=(Country=Region))  empsjp ;
run;
 
data empsall3;
 set empscn  empsjp (rename=(Region=Country)) ;
run;

/***Combining data from all four countries ***/

data empsall4;
set empsall empsall3;
run;

/**or**/


data empsall5;
set empsdk empsfr empsall3;
run;

/**or**/

data empsall5;
set empsdk empsfr empscn empsjp (rename=(Region=Country));
run;

