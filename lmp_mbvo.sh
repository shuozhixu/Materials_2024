#!/usr/bin/bash

rm -rf lammps-mbvo
module load intel/2023a
mkdir lammps-mbvo
cd lammps-mbvo
git clone -b stable https://github.com/lammps/lammps.git mylammps
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
