/* Consider three variations of t-tests
- one sample t-test
- two sample t-tests:
- independent two sample t-test: two samples consist of
entirely different individuals
- matched pairs t-test: the two samples correspond to two distinct
measurements (taken at different times, e.g. before and after treatment
but on the same set of individuals)
*/
libname methods 
	'/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets';

/* two sample t-tests */
/* independent two sample t-test: two samples consist of
entirely different individuals */
proc ttest data=methods.ameshousing3 
		H0=0 /*default, 0 can be changed to any value*/
		sides=2   /*default, L or U*/
		plots(shownull)=interval;
	class central_air;

	/* character variable with two levels */
	var lot_area;
	format central_air $NoYes.;
	title "Two-Sample T-Test";
	title1 "Comparing average lot size for houses 
      with and without central air";
run;

/* Example Handout */
proc ttest data=methods.ameshousing3 plots(shownull)=interval;
	class Masonry_Veneer;
	var SalePrice;
	format Masonry_Veneer $NoYes.;
	title "Two-Sample t-test Comparing Masonry Veneer, No vs. Yes";
run;