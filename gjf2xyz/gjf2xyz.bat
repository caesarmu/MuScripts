@ECHO OFF
SET gjfin=%1
SET gjfdir=%~dp1
SET gjfinbase=%~n1
goawk.exe < %gjfin% "(NF==4 && length($1)<3  && $1~/^[A-Za-z]+$/ && $2~/^[0-9.-]+$/ && $3~/^[0-9.-]+$/ && $4 ~/^[0-9.-]+$/){natom=natom+1}END{print natom}"  > %gjfdir%%gjfinbase%.xyz
ECHO.  >> %gjfdir%%gjfinbase%.xyz 
goawk.exe < %gjfin% "(NF>3 && length($1)<3  && $1~/^[A-Za-z]+$/ && $2~/^[0-9.-]+$/ && $3~/^[0-9.-]+$/ && $4 ~/^[0-9.-]+$/)"  >> %gjfdir%%gjfinbase%.xyz 
ECHO %gjfdir%%gjfinbase%.xyz generated!
EXIT 


