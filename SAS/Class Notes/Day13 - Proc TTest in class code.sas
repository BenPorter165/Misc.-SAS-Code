/* Consider three variations of t-tests
- one sample t-test
- two sample t-tests: 
          - independent two sample t-test: two samples consist of 
            entirely different individuals
          - matched pairs t-test: the two samples correspond to two distinct 
            measurements (taken at different times, e.g. before and after treatment
            but on the same set of individuals)
  */

 /* One sample t-test */

/* Test if average lot area is > than 7500: side =U (upper tail)*/
proc ttest data=methods.ameshousing3 
           h0=7500 /*specifies mean value under null hypothesis*/
           side=U; /*one-sided, upper tail, mean is greater than 7500*/
                   /*side=2-two-sided test, side=L will test for less than the value in H0 */
var lot_area;
run;           