

data phone;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/phone.csv' dlm=',' missover dsd;
input name :$20. land_phone :$14. cell_phone :$14.;
run;


data phone;
length Name $ 20. land_phone cell_phone $ 14.;
infile '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/phone.csv' dlm=',' missover dsd;
input name $ land_phone $ cell_phone $;
run;

data work.sales;
   infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv" dlm=','; 
   input Employee_ID 
   		 First_Name :$12. 
   		 Last_Name :$18. 
		 Gender :$1. 
		 Salary 
		 Job_Title :$25. 
		 Country :$2. 
         Birth_Date :date. 
         Hire_Date :mmddyy.;
         label Job_Title='Sales Title' Hire_Date='Date Hired';
   format Salary dollar12. 
          Birth_Date mmddyy. 
          Hire_Date monyy7.;
run;

data work.sales;
   length  Employee_ID Last_Name $18. First_Name $12.  ;
   infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/sales.csv" dlm=','; 
   input Employee_ID 
   		 First_Name  
   		 Last_Name  
		 Gender :$1. 
		 Salary 
		 Job_Title :$25. 
		 Country :$2. 
         Birth_Date :date. 
         Hire_Date :mmddyy.;
         label Job_Title='Sales Title' Hire_Date='Date Hired';
   format Salary dollar12. 
          Birth_Date mmddyy. 
          Hire_Date monyy7.;
run;

