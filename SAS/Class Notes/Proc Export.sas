proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    dbms=tab;
run;

proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    dbms=tab
    replace;
run;

proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-semicolon.txt"
    dbms=tab
    replace;
    delimiter=";";
run;

proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-comma.txt"
    dbms=tab
    replace;
    delimiter=",";
run;

proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-pipe.txt"
    dbms=tab
    replace;
    delimiter="|";
run;

proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes-space.txt"
    dbms=tab
    replace;
    delimiter=" ";
run;


proc export data=sashelp.shoes
    outfile="/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/shoes.txt"
    dbms=tab
    replace;
    putnames=NO;
run;

proc export data=sashelp.shoes
    outfile="/folders/myfolders/export/shoes.txt"
    dbms=tab
    label
    replace;
run;


/*
Summary: Export a SAS Dataset as a TXT File
How to use PROC EXPORT to generate a 
TXT file. To summarize, you need to follow 
these steps to create a TXT file from 
a SAS dataset:

-Start the PROC EXPORT procedure.
-Use the DATA=-option to specify your SAS dataset.
-Use the OUTFILE=-option to define the location of the TXT file.
-Apply the DBMS=tab option for text files.
-(Optional) Use the REPLACE option to overwrite existing files.
-(Optional) Change the delimiter with the DELIMITER=-option.
-(Optional) Remove column headers with PUTNAMES = NO.
-(Optional) Output column labels with the LABELS option.
-Finish the EXPORT procedure with the RUN statement.

*/