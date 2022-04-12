libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";

proc glm data=methods.ameshousing3 plots=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; /*parameter (mean) estimates*/
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ; /*assesses equal variance 
                                      assumption */
lsmeans heating_qc / adjust=bon ; /*adjusts for doing
                                    multiple comparisons using the Bonferroni 
                                    adjustment*/                                     
run;
