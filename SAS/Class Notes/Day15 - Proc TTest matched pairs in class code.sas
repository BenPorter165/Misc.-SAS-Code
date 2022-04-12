/**Matched Pairs T-Test: one-sample t-test on the difference 
between 2 observations taken from the same individuals **/

/*
- pre and a post value for each individual in the data set
- diff = post-pre
- test is about the true average difference being different/smaller/greater 
  than zero. 
- mu=0 tests for the existence of any significant change
- mu=2 tests if the difference is at least of magnitude 2.   
*/


libname methods "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets";


proc ttest data=methods.market h=0 side=U;
paired post*pre; /*order of the variables
              defines the order when 
              taking the difference: 
              post*pre -> diff=post-pre
              pre*post -> diff=pre-post             
              */
title 'Matched Pairs T-test on the Difference before and after
       a marketing campaign';
run;       
/* default: two-sided test, side=L, side=U
   for one-sided tests*/
 
/*Note of caution: when using side=U or side=L be aware of the order of measurements
when defining the difference, i.e. post*pre will result in a different 
p-value than pre*post in the paired statement */ 
 
 
 
/*note that the paired t-test is the same as running a 
one-sample t-test on the calculated differences where 
diff is a new variable defined as pre-post */ 
data market1;
set methods.market;
diff = pre-post;
run;

proc ttest data=market1;
var diff; /*mean diff = -0.9463, t=-5.59, p-value < 0.0001*/
run; 
  