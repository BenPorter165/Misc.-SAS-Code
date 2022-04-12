proc contents data=orion.orders;
run;

proc contents data=orion.order_item;
run;

/** Solution to Level 1 Exercise **/
/** Merging Data Sets One-to-Many**/

/* part b) */
/* set lib reference first */

libname orion '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Lectures/ORION data library/';

proc contents data=orion.orders;
run;

proc contents data=orion.order_item;
run;

/*common variable is Order_ID*/
/* part c) */

data orion.allorders;
merge orion.orders orion.order_item;
by order_ID;
run;

/* part e) */
data orion.allorders;
merge orion.orders orion.order_item;
by order_ID;
keep order_id order_item_num order_type order_date quantity total_retail_price;
run;

/* part f) */
/* Solution 1 */
data orion.allorders1;
set orion.allorders;
month = month(order_date);
year = year(order_date); /*there is also a quarter function (qrt) to simplify further*/
format month monname3. year yyyy.;
run;

proc print data = orion.allorders1;
where (month =10 or month= 11 or month=12) and year=2011;
run;

/*Solution 2*/
proc print data=orion.allorders;
where '01Oct2011'd <= order_date <= '31Dec2011'd;
run;

