# Geo2Geo
* Convert chemical geometries to other formats on Windows.

## Requirements
* Windows version `busybox64.exe`(<http://frippery.org/busybox/>).
* Add the directory containing `busybox64.exe` and these files to `PATH` of Windows.

### Additional for pwi2xsf
* `ibrav2cell.exe` (and `libgfortran-4.dll`, `msmpi.dll`，`libwinpthread-1.dll` and `libquadmath-0.dll`) in  qe.zip from <https://github.com/advancesoftcorp/espresso/releases>.

## Usage
### Pwscf to xsf format 
#### without `CELL_PARAMETERS`
* `pwi2xsf.bat  pwscf.in`, then you will get `pwscf.xsf`. Or you can set `pwi2xsf.bat` as the default browser for `*.in` file.
* It can deal with `ibrav!=0` or `ibrav=0` combined with `CELL_PARAMETERS {angstrom}`, the atomic coordinates could be `ATOMIC_POSITIONS {angstrom}` or `ATOMIC_POSITIONS {crystal}`.

#### with `CELL_PARAMETERS`
* `busybox64.exe pwo2xsf  pwscf.in/pwscf.out out.xsf`, then you will get `outxsf` from input/output file of Pwscf.
* OR you can use [openbabel](https://github.com/openbabel/openbabel) to covert it, such as `obabel.exe -ipwscf  pwscf.in -ocif -Oout.cif`. 

### POSCAR to pwxsf input 
* `busybox64.exe v2pw POSCAR out.pw`, then you will get the structure in pwscf input format.

### Gaussian gjf to xyz format 
* `gjf2xyz  g09.gjf`, then you will get `g09.xyz`.


