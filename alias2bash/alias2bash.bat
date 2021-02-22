@ECHO OFF

REM HELP ==========================DOSKEY CMDs=================================
REM Unix-like commands 

@DOSKEY ls=dir /B $*
@DOSKEY lsd=tree /F
@DOSKEY mkdir=md $*
@DOSKEY mv=move $*
@DOSKEY cat=type $*
@DOSKEY pwd=cd
@DOSKEY cp=copy $*
@DOSKEY rm=del $*
@DOSKEY diff=fc.exe /c /N /A $1 $2
@DOSKEY grep=findstr /N /I /R /S $*
@DOSKEY which=where $*
@DOSKEY lns=junction64.exe $2 $1
@DOSKEY find=dir $* /s /b 
@DOSKEY md5sum=certutil -hashfile $1 MD5
@DOSKEY base64=del /q %DriveName%\Temp\base64.txt $t certutil -encode $1 %DriveName%\Temp\base64.txt $t type %DriveName%\Temp\base64.txt
IF "x%1" == "x" (ECHO "Unix-like commands: ls, lsd, mkdir, mv, cat, pwd, cp, rm, diff, grep, which,lns, find (find a.dat), md5sum , base64" && PAUSE)
 


 
 

