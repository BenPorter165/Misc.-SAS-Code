proc sort data=orion.product_list
          out=work.product;
	by Supplier_ID;
run;


proc print data=work.prodsup;
	var Product_ID Product_Name Supplier_ID Supplier_Name;
run;


/** Solution to Level 1 Exercise **/
/** Merging Data Sets with Nonmatches **/

/* part a) & b) */
data work.prodsup;
merge work.product orion.supplier;
by supplier_id;
run;

/* part c) & d) */

data work.prodsup;
merge work.product(in=Prod)
      orion.supplier(in=Sup);
by supplier_id;
if Prod=1 and Sup=0;
run;

/* part e) */
proc print data=work.prodsup;
var product_id product_name supplier_id Supplier_Name;
run;