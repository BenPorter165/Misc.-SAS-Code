proc contents data=sashelp.ital_multi;
run;

proc print data=sashelp.ital_multi (obs=10);
var term numdocs role;
run;

title 'Frequency Distribution of Variable Role';
proc freq data=sashelp.ital_multi;
table role;
run; 