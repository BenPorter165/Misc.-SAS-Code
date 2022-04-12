/* Solution to Level 2 exercise **/
/** Merging Data Sets One-to-Many**/

/* part a) */
proc sort data=orion.product_list out=work.product_list;
by Product_Level;
run;

/* part b) */
data work.listlevel;
merge orion.product_level work.product_list;
by product_level;
run;

/* part c) */

proc print data=work.listlevel;
var product_level product_level_name product_id product_name;
where product_level=3;
run;