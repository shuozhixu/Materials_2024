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

## Nanolaminated Ag

There are three different slip planes.

### Plane 1

Run the simulation with files `lmp.in`, `data.CLS_Ag_SITB_5nmy_1`, and `AgCu.eam.alloy`.

Once it is finished, you will find a file `shear.mobile.txt`. Plot a curve using the column 2 and column 8 as the _x_ and _y_ axes, respectively, and that is the stress-strain curve.

### Other planes

Repeat the simulation for the other two planes. Note that the data file should be changed to `data.CLS_Ag_SITB_5nmy_x`, where `x` is either `2` or `3`.

Plot the three strain-stress curves in the same figure, similar to Figure 7 of [this paper](http://dx.doi.org/10.1557/s43578-021-00261-y).

## Ag/Cu Nanolaminate - type 1

There are ten different slip planes in Ag and Cu, respectively. Thus, in total, there are 20 different slip planes.

Plot the 20 strain-stress curves in four figures. The first two figures are for when the dislocation is in Ag, and there should be five curves in each figure. The last two figures are for when the dislocatin is in Cu, and there should be five curves in each figure as well.

## Ag/Cu Nanolaminate - type 2

There are ten different slip planes in Ag and Cu, respectively. Thus, in total, there are 20 different slip planes.