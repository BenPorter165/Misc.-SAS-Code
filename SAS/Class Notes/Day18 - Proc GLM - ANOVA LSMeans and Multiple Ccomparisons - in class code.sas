libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";

proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; 
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ;  
/* 
hovtest=levene assesses whether the different groups of the variable 
saleprice have equal variance (4 groups because the 
variable heating_qc has 4 levels)

It is the class variable that has to follow 
the means statement (not the response variable); 

when we have more than one variable in the class statement we can
select how we want to split the groups up in the means statement; 
We can chose only one of the variables from the 
class statement or an interaction for example 
*/
ods select ParameterEstimates HOVFTest 
Means LSMeans Diff DiffPlot;
lsmeans heating_qc / adjust=bon ;   /*Bonferroni adjustment--
while easy to apply they tend to be overly conservative
*/                                  
run;

/*Muliple Comparison adjustments: become necessary 
when we conduct many tests at the same time:
- each time we conduct a test at a significance level alpha and we
base our decision to reject the null hypothesis on alpha, there is a 
chance of making an incorrect decision (Type I error -- falsely rejecting the
null hypothesis) 
- the more tests we conduct using alpha the higher the
probability of falsely rejecting at least one null 
hypothesis
- we need an adjustment to the level of signicance to 
decrease the probability of the "overall" Type I error rate
- the overall Type I error rate is defined as the 
probability of making at least one incorrect decision in m 
distinct tests
- We still want this probability to be no more than alpha 
*/

proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; 
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ;  
lsmeans heating_qc / pdiff=control('TA') /*specifies 
                     control group*/
                     adjust=dunnett; /*dunnett is the 
                     type of adjustment*/
lsmeans heating_qc / pdiff=all
                     adjust=tukey; /*Tukey-Kramer as 
                     the type of adjustment*/                      
run;

/**
Using 'adjust=dunnett' without specifying a reference group
**/
proc glm data=methods.ameshousing3 plots(unpack)=diagnostics;
class heating_qc ; 
model saleprice = heating_qc / solution; 
title 'One-way ANOVA predicting sale price using 
 heating_qc';
means  heating_qc / hovtest=levene ;  
lsmeans heating_qc / adjust=dunnett; /* reference 
group will be 'Ex' because, by default, the first level of the 
effect is used as the control.  */
run;

