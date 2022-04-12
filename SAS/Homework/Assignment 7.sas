

/* part a) */

data birthweight;
infile "/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Assignments/birthweight_reduced.csv" dsd missover dlm="," firstobs=2;
/*input id length birthweight  headcircumference gestation smoker $ motherage mnocig mheight mppwtt
      fage fedyrs fnocig fheight lowbwt $ mage35 $;*/
input id headcircumference length birthweight gestation smoker $ mage mnocig mheight mppwt fage 
      fedyrs fnocig fheight lowbwt $ mage35 $;     
run;

/* parts b) and c) */

ods graphics on;

proc sgscatter data=birthweight;
plot birthweight*(length headcircumference) /jitter;
title 'Pairwise Scatterplots';
title1 'Length and Head Circumference of Newborn'; 
label length='Length' headcircumference='Head Circumference' 
birthweight='Birthweight';
run; 

proc sgscatter data=birthweight;
plot birthweight*(gestation mheight) /jitter;
title 'Pairwise Scatterplots';
title1 "Gestation and Mother's Height"; 
label gestation='Gestation' mheight="Mother's Height" 
birthweight='Birthweight';
run; 

proc sgscatter data=birthweight;
plot birthweight*(mnocig fnocig) /jitter;
title 'Pairwise Scatterplots';
title1 "Number of Cigarettes smoked a day by Mother & Father"; 
label mnocig="Cigarettes a day smoked by Mother"  fnocig="Cigarettes a day smoked by Father" birthweight='Birthweight';
run; 


/* part d) */
ods trace on;
proc corr data=birthweight;
var length headcircumference gestation mheight;
with birthweight;
ods select VarInformation PearsonCorr;
run;
ods trace off;
/*Answer: length: 0.6970, headc: 0.7364, gestation: 0.7063, 
          mheight: 0.3680*/

/* part e) */

proc corr data=birthweight;
var length ;
with birthweight;
partial headcircumference gestation;
run;
/*r=0.2501*/

/* part f)	*/

proc reg data=birthweight plot=diagnostics(unpack);
model  birthweight = length headcircumference gestation mheight/ vif;
run ;
/*F-value: 26.30, numerator df = 4 denominator df = 37, p-value <0.0001*/
/*Overall, model is useful for predicting birthweight*/

