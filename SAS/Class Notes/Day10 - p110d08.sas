********** Create Data **********;
data empsau;
   input First $ Gender $ EmpID;
   datalines;
Togar   M   121150
Kylie   F   121151
Birin   M   121152
;

data phonec;
   input EmpID Phone $15.;
   datalines;
121150 +61(2)5555-1795
121152 +61(2)5555-1667
121153 +61(2)5555-1348
;

********** IN= Option **********;


********** Matches Only **********;


********** Non-Matches from empsau Only **********;

********** Non-Matches from PhoneC Only **********;


********** All Non-Matches **********;
