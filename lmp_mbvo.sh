#!/usr/bin/bash

mkdir -p software
cd software
rm -rf lammps-mbvo
mkdir lammps-mbvo
cd lammps-mbvo
module load intel/2023b
module load git/2.42.0-GCCcore-13.2.0
git clone -b stable_22Jul2025_update6 https://github.com/lammps/lammps.git mylammps
cd mylammps/lib/voronoi
wget --no-check-certificate https://math.lbl.gov/voro++/download/dir/voro++-0.4.6.tar.gz
tar -xf voro++-0.4.6.tar.gz
cd voro++-0.4.6
make
cd ../
ln -s voro++-0.4.6/src includelink
ln -s voro++-0.4.6/src liblink
cd ../../src
make yes-manybody
make yes-voronoi
make mpi
