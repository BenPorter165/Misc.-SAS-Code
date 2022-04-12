proc freq data=sashelp.baseball nlevels;
table position;
run;



/* Will not work */
/* The input function requires the character values 
 to already look like numerical values but SAS just does not
 recognize them as numerical yet */
data new;
set sashelp.baseball;
   numeric_position = input(position, $2.);
run;


/* to automate procedures or calculations in SAS we use a 'macro' */
/* macros are functions in SAS */
/* macros always start with a % sign*/


%let DSIn    = Sashelp.Baseball;     /* name of input data set */
%let VarList = Position; /* name of categorical variables we want to
                          turn into dummy variables */
 
proc freq data=&DSIn;
   tables &VarList;
run;

/*translates to*/

proc freq data=Sashelp.Baseball;
   tables position;
run;

/* An easy way to generate dummy variables is to use PROC GLMSELECT */
/* 1. add a fake response variable */
data AddFakeY / view=AddFakeY;
set &DSIn;
_Y = 0;
run;


/* 2. Create the dummy variables as a GLM design matrix. Include the original variables, if desired */
proc glmselect data=AddFakeY NOPRINT outdesign(addinputvars)=Want(drop=_Y);
   class      &VarList;   /* list the categorical variables here */
   model _Y = &VarList /  noint selection=none;
run;

/*Now we can include the positions we are interested in into the model:*/

proc glm data=want;
class division ;
model logsalary = nBB crHits division 'Position 1B'n 'Position 2B'n 'Position 3B'n  ;
run;
/*Note that all other positions automatically 
get 'lumped' together into a category 'other' */



