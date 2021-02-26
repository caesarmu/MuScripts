# pwi2xsf
Convert Quantum Espresso (pwscf) input file without "CELL_PARAMETERS" to xsf format on Windows. If the input file contains "CELL_PARAMETERS", you can use [openbabel](https://github.com/openbabel/openbabel) to covert it, such as `obabel.exe -ipwscf  pwscf.in -ocif -Oout.cif`. 

## Requirements
* Windows version `busybox64.exe`(http://frippery.org/busybox/).
* `ibrav2cell.exe` (and `libgfortran-4.dll`, `msmpi.dll`，`libwinpthread-1.dll` and `libquadmath-0.dll`) in  qe.zip from [advancesoftcorp
/
espresso](https://github.com/advancesoftcorp/espresso/releases).

## Usage
* `pwi2xsf.bat  pwscf.in`, then you will get pwscf.xsf. Or you can set `pwi2xsf.bat` as the default browser for `*.in` file.
* It can deal with `ibrav!=0` or `ibrav=0` combined with `CELL_PARAMETERS {angstrom}`, the atomic coordinates could be `ATOMIC_POSITIONS {angstrom}` or `ATOMIC_POSITIONS {crystal}`.

