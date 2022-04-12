data empdata;
input IdNumber $ 1-4 LastName $ 8-18 FirstName $ 19-28
      City $ 29-41 State $ 42-43 
      Gender $ 45 JobCode $ 49-51 Salary 55-60 @63 Birth date9.
      @73 Hired date9. HomePhone $ 85-98;
format birth hired date9.;
datalines;
1919   Adams      Gerald    Stamford     CT M   TA2   34376   12SEP1990   04JUN2007   203/781-1255
1653   Ahmad      Azeem     Bridgeport   CT F   ME2   35108   15OCT1984   09AUG2010   203/675-7715
1400   Alvarez    Gloria    New York     NY M   ME1   29769   05NOV1987   16OCT2010   212/586-0808
1350   Arthur     Barbara   New York     NY F   FA3   32886   31AUG1985   29JUL2010   718/383-1549
1401   Avery      Jerry     Paterson     NJ M   TA3   38822   13DEC1970   17NOV2005   201/732-8787
1499   Barefoot   Joseph    Princeton    NJ M   ME3   43025   26APR1974   07JUN2010   201/812-5665
1101   Basquez    Richardo  New York     NY M   SCP   18723   06JUN1982   01OCT2010   212/586-8060
1333   Beaulieu   Armando   Stamford     CT M   PT2   88606   30MAR1983   10FEB2011   203/781-1777
1402   Blalock    Ralph     New York     NY M   TA2   32615   17JAN1983   02DEC2010   718/384-2849
1479   Bostic     Marie     New York     NY F   TA3   38785   22DEC1988   05OCT2007   718/384-8816
1403   Bowden     Earl      Bridgeport   CT M   ME1   28072   28JAN1989   21DEC2016   203/675-3434
1739   Boyce      Jonathan  New York     NY M   PT1   66517   25DEC1984   27JAN2011   212/587-1247
1658   Bradley    Jeremy    New York     NY M   SCP   17943   08APR1987   29FEB2012   212/587-3622
1428   Brady      Christine Stamford     CT F   PT1   68767   04APR1980   16NOV2011   203/781-1212
1782   Brown      Jason     Stamford     CT M   ME2   35345   04DEC1980   22FEB2012   203/781-0019
1244   Bryant     Leonard   New York     NY M   ME2   36925   31AUG1983   17JAN2008   718/383-3334
1383   Burnette   Thomas    New York     NY M   BCK   25823   25JAN1985   20OCT2009   718/384-3569
1574   Cahill     Marshall  New York     NY M   FA2   28572   27APR1980   20DEC2012   718/383-2338
1789   Canales    Viviana   New York     NY M   SCP   18326   23JAN1977   11APR2008   212/587-9000
1404   Carter     Donald    New York     NY M   PT2   91376   24FEB1973   01JAN2010   718/384-2946
1437   Carter     Dorothy   Bridgeport   CT F   A3    33104   20SEP1980   31AUG2004   203/675-4117
1639   Carter     Karen     Stamford     CT F   A3    40260   26JUN1977   28JAN2014   203/781-8839
1269   Caston     Franklin  Stamford     CT M   NA1   41690   03MAY1972   28NOV2012   203/781-3335
1065   Chapman    Neil      New York     NY M   ME2   35090   26JAN1977   07JAN2007   718/384-5618
1876   Chin       Jack      New York     NY M   TA3   39675   20MAY1978   27APR2015   212/588-5634
1037   Chow       Jane      Stamford     CT F   TA1   28558   10APR1984   13SEP2012   203/781-8868
1129   Cook       Brenda    New York     NY F   ME2   34929   08DEC1981   17AUG2011   718/383-2313
1988   Cooper     Anthony   New York     NY M   FA3   32217   30NOV1979   18SEP2004   212/587-1228
1405   Davidson   Jason     Paterson     NJ M   SCP   18056   05MAR1986   26JAN2012   201/732-2323
1430   Dean       Sandra    Bridgeport   CT F   TA2   32925   28FEB1982   27APR2017   203/675-1647
1983   Dean       Sharon    New York     NY F   FA3   33419   28FEB1962   30APR2005   718/384-1647
1134   Delgado    Maria     Stamford     CT F   TA2   33462   05MAR1989   21DEC2016   203/781-1528
1118   Dennis     Roger     New York     NY M   PT3   111379  16JAN1964   18DEC2000   718/383-1122
1438   Desai      Aakash    Stamford     CT F   TA3   39223   15MAR1985   18NOV2007   203/781-2229
1125   Dunlap     Donna     New York     NY F   FA2   28888   08NOV1988   11DEC2007   718/383-2094
1475   Eaton      Alicia    New York     NY F   FA2   27787   15DEC1981   13JUL2010   718/383-2828
1117   Edgerton   Joshua    New York     NY M   TA3   39771   05JUN1983   13AUG2012   212/588-1239
1935   Fernandez  Katrina   Bridgeport   CT F   NA2   51081   28MAR1974   16OCT2011   203/675-2962
1124   Fields     Diana     White Plains NY F   FA1   23177   10JUL1978   01OCT2010   914/455-2998
1422   Fletcher   Marie     Princeton    NJ F   FA1   22454   04JUN1984   06APR2011  201/812-0902
1616   Flowers    Annette   New York     NY F   TA2   34137   01MAR1990   04JUN2013   718/384-3329
1406   Foster     Gerald    Bridgeport   CT M   ME2   35185   08MAR1981   17FEB2007   203/675-6363
1120   Garcia     Jack      New York     NY M   ME1   28619   11SEP1992   07OCT2013   718/384-4930
1094   Gomez      Alan      Bridgeport   CT M   FA1   22268   02APR1990   17APR2011   203/675-7181
1389   Gordon     Levi      New York     NY M   BCK   25028   15JUL1979   18AUG2010   718/384-9326
1905   Graham     Alvin     New York     NY M   PT1   65111   16APR1992   29MAY2012   212/586-8815
1407   Grant      Daniel    Mt. Vernon   NY M   PT1   68096   23MAR1989   18MAR2010   914/468-1616
1114   Green      Janice    New York     NY F   TA2   32928   18SEP1989   27JUN2007   212/588-1092
;


options nodate pageno=1 linesize=64 pagesize=60;
proc sort data=empdata out=tempemp;
   by jobcode gender;
run;
proc print data=tempemp split='*' sumlabel='Total' grandtotal_label='Grand Total';
   id jobcode;
   by jobcode;
   var gender salary;
   sum salary;
   label jobcode='Job Code*========'
         gender='Gender*======'
         salary='Annual Salary*=============';
   format salary dollar11.2;
   where jobcode contains 'FA' or jobcode contains 'ME';
   title 'Salary Expenses';
run;