@ECHO OFF
REM ibrav2cell.exe, libgfortran-4.dll, msmpi.dll and libquadmath-0.dll needed
SET BinHome=%~dp0
SET qein=%1
SET qeinbase=%~n1
SET qeindir=%~dp1
SET PATH=%PATH%;%BinHome%
ECHO  ^&SYSTEM > %qeindir%cell.in
busybox64.exe awk "/ibrav/" %qein% >> %qeindir%cell.in
busybox64.exe awk "/celldm/" %qein% >> %qeindir%cell.in
busybox64.exe awk -F = "BEGIN{IGNORECASE=1}/^ *a *=/{print \"celldm(1)=\", $NF/0.529}" %qein% >> %qeindir%cell.in
busybox64.exe awk -F = "BEGIN{IGNORECASE=1}/^ *a *=/{latta=$NF}/^ *b *=/{print \"celldm(2)=\", $NF/latta}"  %qein%  >> %qeindir%cell.in
busybox64.exe awk -F = "BEGIN{IGNORECASE=1}/^ *a *=/{latta=$NF}/^ *c *=/{print \"celldm(3)=\", $NF/latta}" %qein% >> %qeindir%cell.in
busybox64.exe awk -F = "BEGIN{IGNORECASE=1}/^ *cosbc *=/{print \"celldm(4)=\", $NF}" %qein%   >> %qeindir%cell.in
busybox64.exe awk -F = "BEGIN{IGNORECASE=1}/^ *cosac *=/{print \"celldm(5)=\", $NF}" %qein%   >> %qeindir%cell.in
busybox64.exe awk -F = "BEGIN{IGNORECASE=1}/^ *cosab *=/{print \"celldm(6)=\", $NF}" %qein%   >> %qeindir%cell.in
ECHO / >>%qeindir%cell.in
ECHO CRYSTAL >%qeindir%%qeinbase%.xsf
ECHO PRIMVEC >>%qeindir%%qeinbase%.xsf
ibrav2cell.exe < %qeindir%cell.in > %qeindir%init.cell 2>nul
busybox64.exe awk "BEGIN{ IGNORECASE=1;uselatt=0; latt=\"\";}(NR==FNR && $0 ~ /CELL_PARAMETERS.*angstrom/){uselatt=1;for(i=1;i<=3;i++){getline;latt=latt \"\n\"$0;}}(uselatt == 0 && NR>FNR && $0 ~ /Unit cell in units of alat/){alat=$(NF-1);for(i=1;i<=3;i++){getline;latt=latt\"\n\"$1*alat*0.529\"  \"$2*alat*0.529\"  \"$3*alat*0.529;}}END{print latt;}" %qein% %qeindir%init.cell > %qeindir%last.cell
 
busybox64.exe awk "($0 !~ /^ *$/){print $0;}" %qeindir%last.cell >> %qeindir%%qeinbase%.xsf
ECHO PRIMCOORD >>%qeindir%%qeinbase%.xsf
busybox64.exe awk < %qein%  -F = "BEGIN{IGNORECASE=1}/^ *nat *=/{print $NF ,1}" >>%qeindir%%qeinbase%.xsf

busybox64.exe awk "BEGIN{IGNORECASE=1}(NR==FNR && NR>1 && NR<5){for(i=1;i<=3;i++){latt[NR-1,i]=$i;}}(NR>FNR && $0 ~ /nat/){natom=$NF;}(NR>FNR && $0 ~ /ATOMIC_POSITIONS/){if($0 ~/angstr/){for(i=1;i<=natom;i++){getline;printf \" %%3s%%14.8f%%14.8f%%14.8f%%3d%%3d%%3d\n\",$1,$2,$3,$4,length($5),length($6),length($7);}}else if($0 ~/crys/){for(i=1;i<=natom;i++){getline; for(j=1;j<=3;j++){car[1]=$2*latt[1,1]+$3*latt[2,1]+$4*latt[3,1];car[2]=$2*latt[1,2]+$3*latt[2,2]+$4*latt[3,2];car[3]=$2*latt[1,3]+$3*latt[2,3]+$4*latt[3,3];} printf \" %%3s%%14.8f%%14.8f%%14.8f%%3d%%3d%%3d\n\",$1,car[1],car[2],car[3],length($5),length($6),length($7);}}}"  %qeindir%last.cell %qein%  >>%qeindir%%qeinbase%.xsf
DEL /Q /F %qeindir%cell.in %qeindir%init.cell %qeindir%last.cell
ECHO %qeindir%%qeinbase%.xsf generated!
REM EXIT 


