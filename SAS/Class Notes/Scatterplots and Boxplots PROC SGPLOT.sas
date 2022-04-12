/*this code will display all style templates and color definitions in the LOG window*/

proc template;
   source Styles.Default;
run;

/*Scatterplot using Proc SGPLOT*/
ods graphics on / attrpriority=none;
proc sgplot data=sashelp.heart;
styleattrs datasymbols=(circlefilled star);
scatter x=systolic y=diastolic / group=sex;
run;
ods graphics / reset;

/*Boxplot using Proc SGPLOT*/
ods graphics on / attrpriority=none;
proc sgplot data=sashelp.heart;
vbox diastolic / group=sex   ;
yaxis label = "Diastolic Bloodpressure";
run;
ods graphics / reset;


/*Side-by-Side Boxplot using Proc SGPLOT*/

/* Open the LISTING destination and assign the LISTING style to the graph */ 
ods listing style=listing;
ods graphics / width=5in height=2.81in;
title 'Mileage by Type and Origin';

/* Run PROC SGPLOT on data SASHELP.CARS, selecting for sedans and sports cars */
proc sgplot data=sashelp.cars(where=(type in ('Sedan' 'Sports'))) ;
  /*  generate a vertical box plot that groups by vehicle type
   *  and shows mileage by manufacturing region */
  vbox mpg_city / category=origin group=type groupdisplay=cluster
    lineattrs=(pattern=solid) whiskerattrs=(pattern=solid); 
  xaxis display=(nolabel);
  yaxis grid;
  keylegend / location=inside position=topright across=1;
run;
