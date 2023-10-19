#!/usr/bin/bash

rm -f *.lmp data.*

a=4.09

atomsk --create fcc $a Ag orient [1-10] [11-2] [111] -duplicate 152 10 19 Ag_top.cfg

atomsk --create fcc $a Ag orient [1-10] [11-2] [111] -duplicate 151 10 19 Ag_bottom.cfg

atomsk Ag_top.cfg -deform X -0.00328947368 0.0 Ag_top_deformed.cfg

atomsk Ag_bottom.cfg -deform X 0.00331125827 0.0 Ag_bottom_deformed.cfg

atomsk --merge Z 2 Ag_top_deformed.cfg Ag_bottom_deformed.cfg data.Ag.cfg lmp

mv data.Ag.lmp data.Ag

rm -f *.cfg