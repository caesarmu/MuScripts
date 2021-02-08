# pwi2xsf
Convert Quantum Espresso (pwscf) Input file to xsf format on Windows

## Requirements
* Windows version **awk** or **[GoAWK](https://github.com/benhoyt/goawk)**
* **ibrav2cell.exe** in  qe.zip from [advancesoftcorp
/
espresso](https://github.com/advancesoftcorp/espresso/releases)

## Usage
* Make sure that the coordinates of atoms are cartesian.
* `pwi2xsf.bat  pwscf.in`, then you will get pwscf.xsf.

## To do
* Applicable for other coordinate systems of atoms
