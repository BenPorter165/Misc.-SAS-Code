/*Only works for data files ending in 
         .sas7dbat
         
  Only needed for data files that are 
  on the shared course drive       
*/


/* Step 1*/
libname examdata '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Assignments';

/* Step 2*/

data mydata;
set examdata.conference;
run;