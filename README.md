# Confined layer slips

## Foreword

The purpose of this project is to calculate the confined layer slip (CLS) process in nanolaminated Ag and two types of Ag/Cu nanolaminates.

Please read the following journal articles to understand how the CLS process can be calculated:

- Weisen Ji, Wu-Rong Jian, Yanqing Su, Shuozhi Xu, Irene J. Beyerlein, [Role of stacking fault energy in confined layer slip in nanolaminated Cu](http://dx.doi.org/10.1007/s10853-023-08779-8), J. Mater. Sci. (in press)
- Wu-Rong Jian, Shuozhi Xu, Yanqing Su, Irene J. Beyerlein, [Role of layer thickness and dislocation distribution in confined layer slip in nanolaminated Nb](http://dx.doi.org/10.1016/j.ijplas.2022.103239), Int. J. Plast. 152 (2022) 103239
- Wu-Rong Jian, Yanqing Su, Shuozhi Xu, Weisen Ji, Irene J. Beyerlein, [Effect of interface structure on dislocation glide behavior in nanolaminates](http://dx.doi.org/10.1557/s43578-021-00261-y), J. Mater. Res. 36 (2021) 2802--2815

None of the papers above are in the Cu/Ag system. [Here](https://drive.google.com/drive/folders/10ONTPaz5GWNJaJW-JFp2eQ26b_omDWcM?usp=sharing) are some prior work on Cu/Ag nanolaminates.

Note: All files for calculations can be found in this GitHub repository, except the data files which can be [here](https://drive.google.com/drive/folders/1YZu87CYd2v4Lga5JAvvNwOLzXJRPqeJn?usp=sharing). The reason is that the data files are too large for GitHub.

In each of the following material systems, the dislocation can lie and glide on one of many slip planes.

Please, each time you run a new type of simulation, create a new directory.

## LAMMPS

LAMMPS on [OSCER](http://www.ou.edu/oscer.html) likely does not come with many packages. To build more packages into LAMMPS, please visit [this page](https://docs.lammps.org/Build_package.html).

To finish this project, at least two packages are needed:

- MANYBODY package. This is to use the manybody potential such as the embedded-atom method potential.
- VORONOI package. This is to calculate Voronoi tessellation of the atoms in the simulation cell. To learn more, please visit [this page](https://docs.lammps.org/compute_voronoi_atom.html).

Therefore, the first step in this project is to install both packages to your own version of LAMMPS. Once you did that, modify one line in `lmp.batch` to

	mpirun -np $SLURM_NPROCS /YOURPATH/lmp_mpi -in lmp.in

where `YOURPATH` is your own path to your newly compiled executable `lmp_mpi`.

Note: Feel free to increase the walltime (default: 300 hours) and/or number of nodes (default: 1) and/or number of cores (default: 32), as needed.

## Nanolaminated Ag

There are three different slip planes.

### Plane 1

Run the simulation with files `lmp.in`, `data.Ag_5nm_1`, `AgCu.eam.alloy`, and `lmp.batch`.

Once it is finished, you will find a file `shear.mobile.txt`. Column 2 is the shear strain, which is unitless, while column 8 is the shear stress, in units of GPa. Plot a curve using the two columns as the _x_ and _y_ axes, respectively, and that is the stress-strain curve.

From the stress-strain curve, one can determine the critical stress for the dislocation to start moving. The critical stress is the first local maximum stress, excluding the first coupe of points. Specifically, the critical stress is 0.0691 GPa, taken at the strain of 0.00405.

All dump files, which contain atomistic structures, can be found in the directory `/ourdisk/hpc/cm3atou/dont_archive/mahshadfani/Ag_1`. Check if the dislocation climbs, following Figures 3 & 6 of [this paper](http://dx.doi.org/10.1557/s43578-021-00261-y) and Figure 7 of [this paper](http://dx.doi.org/10.1007/s10853-023-08779-8).

### Other planes

Repeat the simulation for the other two planes. Note that you should use the data file `data.Ag_5nm_x`, where `x` is either `2` or `3`. In `lmp.in`, make two changes:

- Line 19, change the corresponding data file name.
- Line 28, change the last number `1` to `2` or `3`.

Determine their respective critical stresses for dislocation glide. Check if the dislocation climbs. Note that the dump files can be found in the directory `/ourdisk/hpc/cm3atou/dont_archive/mahshadfani/Ag_x`, where `x` is `2` or `3`.

Plot the three strain-stress curves in the same figure, similar to Figure 7 of [this paper](http://dx.doi.org/10.1557/s43578-021-00261-y).

## Ag/Cu Nanolaminate - type 1

The interface has a complex structure, making it difficult to determine how many different slip planes there are in each material (i.e., Ag or Cu). Therefore, we simply choose ten adjacent planes in each material and place a dislocation on each plane. Thus, in total, we study 20 different slip planes.

### Plane 1 in Ag

The simulation requires files `lmp.in`, `data.AgCu_type1_Ag_5nm_1`, `AgCu.eam.alloy`, `lmp.batch`. Make these changes in `lmp.in`:

- Line 19, change the data file name to the correct one
- Line 23, change `Ag Ag` to `Cu Ag`
- Line 28, change the last directory name `AgCu_type1_Ag_1`. In fact, you can set the directory name as anything; just need to distinguish it from other directories.

In each case, determine (i) value of the critical stress and (ii) whether the dislocation climbs.

### Other planes

Follow the steps above and run simulations on the other nine planes in Ag. In each simulation, use the data file `data.AgCu_type1_Ag_5nm_x`, where `x` varies from `2` to `10`. Remember to make the three changes in `lmp.in`. 

Once all simulations are done, plot the ten strain-stress curves in two figures. The first figure is for planes 1 to 5, while the second for planes 6 to 10.

### Planes in Cu

Follow the steps above. Note that the data files are now `data.AgCu_type1_Cu_5nm_x`, where `x` varies from `1` to `10`.

## Ag/Cu Nanolaminate - type 2

Follow the steps in the previous section `Ag/Cu Nanolaminate - type 1`. The data file here is either `data.AgCu_type2_Cu_5nm_x` or `data.AgCu_type2_Cu_5nm_x`, where `x` varies from `1` to `10`.