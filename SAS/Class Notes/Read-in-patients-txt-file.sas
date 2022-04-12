*Program to read in data set patients.txt;

*if necessary, uncomment libname below and change path to match your instructional environment;
 
*libname clean_d "D:\Workshop\WINSAS\GASCBD\Data";

*Submit this data step as is - we will learn more about the process soon ;


data patients;
   infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/patients.txt" 
 lrecl=30   truncover; /* take care of problems
                                 with short records */
   input @1  Patno    $3.            /* @# specifies the column at which SAS */  
         @4 gender    $1.            /*  should read in the variable */
         @5  Visit    mmddyy10.      /*formatting to either character or numerical variable + length */
         @15 HR       3.			 /*mmddyy10. specifies informat */
         @18 SBP      3.
         @21 DBP      3.
         @24 Dx       $3.
         @27 AE       $1.;
   label Patno   = "Patient Number". /*creating labels*/
         Gender  = "Gender"
         Visit   = "Visit Date"
         HR      = "Heart Rate"
         SBP     = "Systolic Blood Pressure"
         DBP     = "Diastolic Blood Pressure"
         Dx      = "Diagnosis Code"
         AE      = "Adverse Event?";
   format visit mmddyy10.;  /*dates are stored as intergers in SAS 
       						format allows to show the date reformatted*/
run;

