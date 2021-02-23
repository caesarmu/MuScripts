# pwi2xsf
Convert Quantum Espresso (pwscf) input file without "CELL_PARAMETERS" to xsf format on Windows. If the input file contains "CELL_PARAMETERS", you can use [openbabel](https://github.com/openbabel/openbabel) to covert it, such as `obabel.exe -ipwscf  pwscf.in -ocif -Oout.cif`. 

## Requirements
* Windows version `busybox64.exe`(http://frippery.org/busybox/)**.
* **`ibrav2cell.exe` (and `libgfortran-4.dll`, `msmpi.dll` and `libquadmath-0.dll`)** in  qe.zip from [advancesoftcorp
/
espresso](https://github.com/advancesoftcorp/espresso/releases).
* Put `busybox64.exe`, `ibrav2cell.exe`, `libgfortran-4.dll`, `msmpi.dll` and `libquadmath-0.dll` into a directory, and add it to `PATH`.
/
espresso](https://github.com/advancesoftcorp/espresso/releases)
* Put goawk.exe, libgfortran-4.dll, msmpi.dll and libquadmath-0.dll in a subdirectory `bravlib`.

## Usage
* Make sure that the coordinates of atoms are cartesian.
* `pwi2xsf.bat  pwscf.in`, then you will get pwscf.xsf.

## To do
* Applicable for other coordinate systems of atoms
