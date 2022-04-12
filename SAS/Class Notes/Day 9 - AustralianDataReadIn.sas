/* Generated Code (IMPORT) */
/* Source File: Australian Tourism.jmp */
/* Source Path: /home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets */
/* Code generated on: 9/21/21, 9:52 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/ulrike1/my_shared_file_links/ulrike1/Stat 484-584/Data Sets/Australian Tourism.jmp';
option validvarname=V7;
PROC IMPORT DATAFILE=REFFILE
	DBMS=JMP
	OUT=WORK.IMPORT;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);