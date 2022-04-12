title 'Distribution of Blood Pressure';
/*For extensive documentation use the following link: 

https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/grstatproc/p1t32i8511t1gfn17sw07yxtazad.htm

and references linked from this website
*/

/*Example: overlayed histograms of systolic and diastolic blood pressure*/
proc sgplot data=sashelp.heart;
   histogram diastolic / fillattrs=graphdata3 transparency=0.7 binstart=40 binwidth=10;
   density diastolic / lineattrs=graphdata3;
   histogram systolic / fillattrs=graphdata6 transparency=0.5 binstart=40 binwidth=10;
   density systolic / lineattrs=graphdata6;
   keylegend / location=inside position=topright noborder across=2;
   yaxis grid;
   xaxis display=(nolabel) values=(0 to 300 by 50);
run;

/*basic starting code for a histogram is*/

proc sgplot data=sashelp.heart;
histogram diastolic ;
run;

/*adding a kernel denistiy estimate (nonparametric way to estimate the density)*/
proc sgplot data=sashelp.heart;
histogram diastolic ;
density diastolic / type=kernel;
run;

/*plotting two density estimates, changing default
binwidth and starting point for bins */
proc sgplot data=sashelp.cars;
histogram length /binstart=145 binwidth=5;;
density length /type=kernel;
density length; /*default: Normal*/
title "Distribution of Length";
xaxis label='Length in Inches'; /*changing label from what the default label was*/
run;


/*
fillattrs=graphdata1 - determines fillcolor
lineattrs=graphdata1 - determines linecolor
graphdata1 through graphdata12 are predefined color choices; see link
below for more examples and options 
alternatively change graphdata1 to graphdata5, for example and
see how the histogram changes
*/
proc sgplot data=sashelp.heart;
   histogram diastolic / fillattrs=graphdata1 transparency=0.7 binstart=40 binwidth=10;
   density diastolic / lineattrs=graphdata1 ; 
   histogram systolic /  fillattrs=graphdata5 transparency=0.5 binstart=40 binwidth=10;
   density systolic / lineattrs=graphdata5; 
   keylegend / location=inside position=topright noborder across=2;
   yaxis grid;
   xaxis display=(nolabel) values=(0 to 300 by 50);
run;

/*
https://go.documentation.sas.com/doc/en/statcdc/14.2/statug/statug_odsgraph_sect060.htm#statug.odsgraph.stylegroup
*/
