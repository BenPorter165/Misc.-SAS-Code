********** Create Data **********;
data empsau;
   input First $ Gender $ EmpID;
   datalines;
Togar   M   121150
Kylie   F   121151
Birin   M   121152
Jack    M   121154
Liza    F   121155
Sasha   F   121157 
;

data phonec;
   input EmpID Phone $15.;
   datalines;
121150 +61(2)5555-1795
121152 +61(2)5555-1667
121153 +61(2)5555-1348
121155 +61(2)5555-1679
121156 +61(2)5555-1352
;

/** Non-Matches **/
/** In=Option **/

data empsphone1;
 merge empsau(in=inEmps) 
       phonec(in=inPhone);
 by EmpID;       
 if inEmps=1 and inPhone=0;
run;

/*selecting observations that show up 
in both data sets */
data empsphone1;
 merge empsau(in=inEmps) 
       phonec(in=inPhone);
 by EmpID;       
 if inEmps=1 and inPhone=1; /*=1 ensures that 
 we only pick observations that are part of the 
 data set */
run;

/** change 'and' to 'or' and '0' to '1' and vice versa **/

/*all observations from both 
data sets */
 data empsphone1;
 merge empsau(in=inEmps) 
       phonec(in=inPhone);
 by EmpID;       
 if inEmps=1 or inPhone=1; /*or should give us the 
 total observations in both data sets*/
run;

/*only observations that show up in both 
data sets */
 data empsphone1;
 merge empsau(in=inEmps) 
       phonec(in=inPhone);
 by EmpID;       
 if inEmps=1 and inPhone=1; /*'and' should give us the 
 observations that appear in both data sets*/
run;
 
 

