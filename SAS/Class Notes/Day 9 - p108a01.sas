 /***************************************************************
 *  1. Submit the program.                                      *
 *  2. Determine the reason for the invalid data that           *
 *     appears in the SAS log.                                  * 
 *  3. Which statement best describes the invalid data?         *   
 *     The data in the raw data file is bad.	                   *
 *     The programmer incorrectly read the data.	             *
 ****************************************************************/

 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/nonsales.csv" dlm=',';               */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(nonsales)" dlm=',';        */
 /****************************************************************/

%let path=/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets ;

data work.nonsales2;
   infile "&path/nonsales.csv"  dlm=',';   
   input Employee_ID First $ Last $ ;
run;

proc print data=work.nonsales2;
run;
