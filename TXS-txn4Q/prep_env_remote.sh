#!/bin/bash
#SBATCH --cpus-per-task=1 
#SBATCH --gpus-per-node=1 
#SBATCH --mem-per-cpu=2000 
#SBATCH --time=10:0:0  
module purge
module load StdEnv/2020 gcc/9.3.0 cuda/11.4 openmpi/4.0.3 amber/20.12-20.15

parmchk2 -i ligand_files/PPO.mol2 -f mol2 -o ligand_files/PPO.frcmod
parmchk2 -i ligand_files/TXN.mol2 -f mol2 -o ligand_files/TXN.frcmod

cd Prep_environment
tleap -f PPO.in
tleap -f TXN.in
tleap -f complex.in
cd ..

ambpdb -p TXS-txn4.prmtop -c TXS-txn4.inpcrd > TXS-txn4_solvated.pdb
