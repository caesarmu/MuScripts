# pwi2xsf
Convert Quantum Espresso (pwscf) Input file to xsf format on Windows

## Requirements
* Windows version **[GoAWK](https://github.com/benhoyt/goawk)**
* **ibrav2cell.exe (and libgfortran-4.dll, msmpi.dll and libquadmath-0.dll)** in  qe.zip from [advancesoftcorp
/
espresso](https://github.com/advancesoftcorp/espresso/releases)
* Put goawk.exe, libgfortran-4.dll, msmpi.dll and libquadmath-0.dll in a subdirectory `bravlib`.

## Usage
* Make sure that the coordinates of atoms are cartesian.
* `pwi2xsf.bat  pwscf.in`, then you will get pwscf.xsf.

## To do
* Applicable for other coordinate systems of atoms
