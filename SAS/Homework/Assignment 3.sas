/* part a) Loss = StartWeight - EndWeight;*/
/* Submit the code below */
/** First snippet of code **/
data weight_club;
	input IdNumber 1-4 Name $ 6-24 Team $ Endweight StartWeight;
	datalines;
1023 David Shaw         red    189 165
1049 Amelia Serrano     yellow 145 124
1219 Alan Nance         red    210 192
1246 Ravi Sinha         yellow 194 177
1078 Ashley McKnight    red    127 118
1221 Jim Brown          yellow 220   .
1095 Susan Stewart      blue   135 127
1157 Rosa Gomez         green  155 141
1331 Jason Schock       blue   187 172
1067 Kanoko Nagasaka    green  135 122
1251 Richard Rose       blue   181 166
1333 Li-Hwa Lee         green  141 129
1192 Charlene Armstrong yellow 152 139
1352 Bette Long         green  156 137
1262 Yao Chen           blue   196 180
1087 Kim Sikorski       red    148 135
1124 Adrienne Fink      green  156 142
1197 Lynne Overby       red    138 125
1133 John VanMeter      blue   180 167
1036 Becky Redding      green  135 123
1057 Margie Vanhoy      yellow 146 132
1328 Hisashi Ito        red    155 142
1243 Deanna Hicks       blue   134 122
1177 Holly Choate       red    141 130
1259 Raoul Sanchez      green  189 172
1017 Jennifer Brooks    blue   138 127
1099 Asha Garg          yellow 148 132
1329 Larry Goss         yellow 188 174
;
run;

/* Second snippet of code */
proc means data=weight_club;
	class team;
	var Gain;
	output out=OutStat1 Q1=LowerQ Median=Median Q3=UpperQ;
run;

/* Third snippet of code */
Proc Means data=weight_club;
	Class team;
	Var StartWeight EndWeight;
	Output out=OutStat2 Q1=median=Q3= /autoname;
Run;

/*********Reading in data instream**********/


Helmes      Pinot     56 09/14/2012
Helmes      Riesling  38 09/14/2012
Vacca       Merlot    91 09/15/2012
Sterling    Pinot     65 06/30/2012
Sterling    Prosecco  72 06/30/2012
