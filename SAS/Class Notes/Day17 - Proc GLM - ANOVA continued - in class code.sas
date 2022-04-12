libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";

ods trace on;
proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; 
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ; 
lsmeans heating_qc / adjust=bon ;                                     
run;
ods trace off;

/* selecting only two of the plots for the output*/
proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; 
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ; 
ods select RStudentByLeverage CooksDPlot ; /*only ask for the plots 
                               most suited to diagnose outliers & influential &
                               high-leverage points */
lsmeans heating_qc / adjust=bon ;                                     
run;

proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; 
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ; 
ods select ParameterEstimates HOVFTest 
Means LSMeans Diff DiffPlot;
lsmeans heating_qc / adjust=bon ;                                     
run;

