# pwi2xsf
Convert Quantum Espresso (pwscf) Input file to xsf format on Windows

## Requirements
* Windows version **gawk** or **[GoAWK](https://github.com/benhoyt/goawk)**
* **ibrav2cell.exe** in  qe.zip from [advancesoftcorp
/
espresso](https://github.com/advancesoftcorp/espresso/releases)
* Add the directories containing gawk/goawk and ibrav2cell.exe to `PATH` of Windows

## Usage
* Make sure that the coordinates of atoms are cartesian.
* `pwi2xsf.bat  pwscf.in`, then you will get pwscf.xsf.

## To do
* Applicable for other coordinate systems of atoms
