@ECHO OFF
REM ibrav2cell.exe, libgfortran-4.dll, msmpi.dll and libquadmath-0.dll needed
SET BinHome=%~dp0
SET qein=%1
SET qeinbase=%~n1
SET qeindir=%~dp1
SET PATH=%PATH%;%BinHome%\bravlib
ECHO  ^&SYSTEM > cell.in
goawk.exe < %qein% "/ibrav/" >> cell.in
goawk.exe < %qein% "/celldm/" >> cell.in
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *a *=/{print \"celldm(1)=\", $NF/0.529}" >>cell.in
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *a *=/{latta=$NF}/^ *b *=/{print \"celldm(2)=\", $NF/latta}" >>cell.in
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *a *=/{latta=$NF}/^ *c *=/{print \"celldm(3)=\", $NF/latta}" >>cell.in
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *cosbc *=/{print \"celldm(4)=\", $NF}" >>cell.in
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *cosac *=/{print \"celldm(5)=\", $NF}" >>cell.in
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *cosab *=/{print \"celldm(6)=\", $NF}" >>cell.in
ECHO / >>cell.in
ECHO CRYSTAL >%qeindir%%qeinbase%.xsf
ECHO PRIMVEC >>%qeindir%%qeinbase%.xsf
ibrav2cell.exe <cell.in |goawk.exe "(out==1 && id <3){id=id+1;printf \"%%14.8f%%14.8f%%14.8f\n\", $(1)*0.529*unit,$(2)*0.529*unit,$(3)*0.529*unit}/Unit cell in units of alat/{out=1;unit=$(NF-1)}" >>%qeindir%%qeinbase%.xsf
ECHO PRIMCOORD >>%qeindir%%qeinbase%.xsf
goawk.exe < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *nat *=/{print $NF ,1}" >>%qeindir%%qeinbase%.xsf
goawk.exe < %qein% "(NF>3 && length($1)<3  && $1~/^[A-Za-z]+$/ && $2~/^[0-9.-]+$/ && $3~/^[0-9.-]+$/ && $4 ~/^[0-9.-]+$/){printf \" %%3s%%14.8f%%14.8f%%14.8f%%3d%%3d%%3d\n\",$1,$2,$3,$4,length($5),length($6),length($7)}" >>%qeindir%%qeinbase%.xsf
DEL /Q /F cell.in
ECHO %qeindir%%qeinbase%.xsf generated!
EXIT 


