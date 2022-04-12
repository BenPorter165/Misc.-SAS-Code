/**** Set up data library called ORION ****/

/* Step 1: In your local folder directory create a 
           new folder called 'ORION data' */


/* Step 2: Copy the following files to your 
           'ORION data'
           - cre8date.sas
           - setup.sas
           - p199d00.sas
           - Day 11 - libname statement.sas
           */
          
/* Step 3: Open the file cre8date.sas in the 'ORION data' 
           folder */          
          
/* Step 4: Change the statement */

%let path=/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Lectures/ORION data library/;
          
/*to*/      

%let path=/the path address of your 'ORION data' folder/ ;
    
    
/* Step 5: Save and execute cre8date.sas */    

/* Step 6: Verify updated content of 'ORION data' folder */

/* Step 7: Open 'Day 11 - libname statement.sas' and 
           update the path to reflect the 'ORION data' folder */ 

/*
You should now be able to access any data sets saved 
in the 'ORION data' folder by referencing the libname 
'orion'.
*/

