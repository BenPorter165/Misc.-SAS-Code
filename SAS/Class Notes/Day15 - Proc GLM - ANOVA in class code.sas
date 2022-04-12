
/* One-way ANOVA */
/* 'one-way' because we are considering ONE explanatory variable*/

libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";

proc glm data=methods.ameshousing3 plots=diagnostics;
class heating_qc ; /*has 4 levels: Ex Fa Gd TA*/
model saleprice = heating_qc;
title 'One-way ANOVA predicting sale price using 
 heating_qc';
run;
 