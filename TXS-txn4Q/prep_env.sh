#!/bin/bash

source $1/amber22/amber.sh

parmchk2 -i ligand_files/PPO.mol2 -f mol2 -o ligand_files/PPO.frcmod
parmchk2 -i ligand_files/TXN.mol2 -f mol2 -o ligand_files/TXN.frcmod

cd Prep_environment
$1/amber22/bin/tleap -f PPO.in
$1/amber22/bin/tleap -f TXN.in
$1/amber22/bin/tleap -f complex.in
cd ..

ambpdb -p TXS-txn4.prmtop -c TXS-txn4.inpcrd > TXS-txn4_solvated.pdb
