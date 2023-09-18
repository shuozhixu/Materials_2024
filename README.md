# Confined layer slips

## Foreword

The purpose of this project is to calculate the confined layer slip (CLS) process in nanolaminated Ag and two types of Ag/Cu nanolaminates.

Read the following journal articles to learn more about nanolaminates

- Irene J. Beyerlein, Zezhou Li, Nathan A. Mara, [Mechanical properties of metal nanolaminates](https://doi.org/10.1146/annurev-matsci-081320-031236), Annu. Rev. Mater. Sci 52 (2022) 281--304
- Mohammad Nasim, Yuncang Li, Ming Wen, Cuie Wen, [A review of high-strength nanolaminates and evaluation of their properties](https://doi.org/10.1016/j.jmst.2020.03.011), J. Mater. Sci. Tech. 50 (2020) 215--244
- I.J. Beyerlein, J. Wang, [Interface-driven mechanisms in cubic/noncubic nanolaminates at different scales](https://doi.org/10.1557/mrs.2018.319), MRS Bull. 44 (2019) 31--39
- Samikshya Subedi, Irene J. Beyerlein, Richard LeSar, Anthony D. Rollett, [Strength of nanoscale metallic multilayers](https://doi.org/10.1016/j.scriptamat.2017.04.009), Scr. Mater. 145 (2018) 132--136
- Jian Wang, Qing Zhou, Shuai Shao, Amit Misra, [Strength and plasticity of nanolaminated materials](https://doi.org/10.1080/21663831.2016.1225321), Mater. Res. Lett. 5 (2017) 1--19
- A. Misra, J.P. Hirth, R.G. Hoagland, [Length-scale-dependent deformation mechanisms in incoherent metallic multilayered composites](https://doi.org/10.1016/j.actamat.2005.06.025), Acta Mater. 53 (2005) 4817--4824

Read the following journal articles to understand how the CLS process can be calculated:

- Weisen Ji, Wu-Rong Jian, Yanqing Su, Shuozhi Xu, Irene J. Beyerlein, [Role of stacking fault energy in confined layer slip in nanolaminated Cu](http://dx.doi.org/10.1007/s10853-023-08779-8), J. Mater. Sci. (in press)
- Wu-Rong Jian, Shuozhi Xu, Yanqing Su, Irene J. Beyerlein, [Role of layer thickness and dislocation distribution in confined layer slip in nanolaminated Nb](http://dx.doi.org/10.1016/j.ijplas.2022.103239), Int. J. Plast. 152 (2022) 103239
- Wu-Rong Jian, Yanqing Su, Shuozhi Xu, Weisen Ji, Irene J. Beyerlein, [Effect of interface structure on dislocation glide behavior in nanolaminates](http://dx.doi.org/10.1557/s43578-021-00261-y), J. Mater. Res. 36 (2021) 2802--2815

Most papers above are not in the Cu/Ag system. [Here](https://drive.google.com/drive/folders/10ONTPaz5GWNJaJW-JFp2eQ26b_omDWcM?usp=sharing) are some prior work on Cu/Ag nanolaminates.

## LAMMPS

LAMMPS on OSCER does not come with many packages. To build more packages into LAMMPS, please visit [this page](https://docs.lammps.org/Build_package.html).

To finish this project, build your own LAMMPS version with the following two packages included:

- MANYBODY package. This is to use the manybody potential such as the embedded-atom method potential.
- VORONOI package. This is to calculate Voronoi tessellation of the atoms in the simulation cell. To learn more, please visit [this page](https://docs.lammps.org/compute_voronoi_atom.html).

Note: All files for calculations can be found in this GitHub repository, except the data files which can be [here](https://drive.google.com/drive/folders/1YZu87CYd2v4Lga5JAvvNwOLzXJRPqeJn?usp=sharing). The reason is that the data files are too large for GitHub. Feel free to increase the walltime (default: 300 hours) and/or number of nodes (default: 1) and/or number of cores (default: 32), as needed. That would require the modification of `lmp.batch`.

There are three different nanolaminates in this project. In each nanolaminate, the dislocation can lie and glide on one of many slip planes. In total, you will run 43 LAMMPS simulations. Please, each time you run a new type of simulation, create a new directory.

You may run up to 8 jobs at the same time. Each job may take one week to finish, so I expect all simulations to be finished within 6 weeks.

## Ag

The interfacial energy is 407.16 mJ/m<sup>2</sup>.

There are three different slip planes.

### Plane 1

Run the simulation with files `lmp.in`, `data.Ag_5nm_1`, `AgCu.eam.alloy`, and `lmp.batch`.

Once it is finished, you will find a file `shear.mobile.txt`. Column 2 is the shear strain, which is unitless, while column 8 is the shear stress, in units of GPa. Plot a curve using the two columns as the _x_ and _y_ axes, respectively, and that is the stress-strain curve.

From the stress-strain curve, one can determine the critical stress for the dislocation to start moving. The critical stress is the first local maximum stress, excluding the first coupe of points. Specifically, the critical stress is 0.0796 GPa, taken at the strain of 0.003375.

All dump files, which contain atomistic structures, can be found in the directory `/ourdisk/hpc/cm3atou/dont_archive/mahshad1994/Ag_1`. The reason why dump files are in another place is because they are too large for \$HOME, see [LAMMPSatOU](https://github.com/ANSHURAJ11/LAMMPSatOU).

Visualize the dump files in OVITO, check if the dislocation climbs, following Figures 3 & 6 of [this paper](http://dx.doi.org/10.1557/s43578-021-00261-y) and Figure 7 of [this paper](http://dx.doi.org/10.1007/s10853-023-08779-8).

### Other planes

Repeat the simulation for the other two planes. Note that you should use the data file `data.Ag_5nm_x`, where `x` is either `2` or `3`. In `lmp.in`, make two changes:

- Line 19, change the corresponding data file name.
- Line 28, change the last number `1` to `2` or `3`.

Determine their respective critical stresses for dislocation glide. Check if the dislocation climbs. Again, note that the dump files can be found in the directory `/ourdisk/hpc/cm3atou/dont_archive/mahshad/Ag_x`, where `x` is `2` or `3`.

Plot the three strain-stress curves in the same figure, similar to Figure 7 of [this paper](http://dx.doi.org/10.1557/s43578-021-00261-y).

## Ag/Cu Nanolaminate - type 1

The interfacial energy is 580.79 mJ/m<sup>2</sup>.

The interface has a complex structure, making it difficult to determine how many different slip planes there are in each material (i.e., Ag or Cu). Therefore, we simply choose ten adjacent planes in each material and place a dislocation on each plane. Thus, in total, we study 20 different slip planes.

### Plane 1 in Ag

The simulation requires files `lmp.in`, `data.AgCu_type1_Ag_5nm_1`, `AgCu.eam.alloy`, and `lmp.batch`. Make these changes in `lmp.in`:

- Line 19, change the data file name to the correct one
- Line 23, change `Ag Ag` to `Cu Ag`
- Line 28, change the last directory name to `AgCu_type1_Ag_1`. In fact, you can set the directory name as anything; just need to distinguish it from other directories.

In each case, determine (i) value of the critical stress and (ii) whether the dislocation climbs.

### Other planes

Follow the steps above and run simulations on the other nine planes in Ag. In each simulation, use the data file `data.AgCu_type1_Ag_5nm_x`, where `x` varies from `2` to `10`. Remember to make those three changes in `lmp.in`. 

Once all simulations are done, plot the ten strain-stress curves in two figures. The first figure is for planes 1 to 5, while the second for planes 6 to 10.

### Planes in Cu

Follow the steps above. Note that the data files are now `data.AgCu_type1_Cu_5nm_x`, where `x` varies from `1` to `10`.

## Ag/Cu Nanolaminate - type 2

The type 2 interface is also known as the Ag/Cu cube interface. Its interfacial energy is 474.74 mJ/m<sup>2</sup>.

Follow the steps in the previous section `Ag/Cu Nanolaminate - type 1`. The data file here is either `data.AgCu_type2_Ag_5nm_x` or `data.AgCu_type2_Cu_5nm_x`, where `x` varies from `1` to `10`. Here, you will eventually obtain 20 stress-strain curves.