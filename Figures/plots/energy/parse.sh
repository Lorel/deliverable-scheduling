#!/bin/bash
#extract the columns related to the power consumption, compute the percentile
cut -d ' ' -f2,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,8-19 borg-1_100_1h/borg-random.dat | tail -n+2 | luajit parser.lua > data/power_percentiles_random.txt
cut -d ' ' -f2,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,8-19 borg-1_100_1h/borg-spread.dat | tail -n+2 | luajit parser.lua > data/power_percentiles_spread.txt

cut -d ' ' -f2,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,8-19 borg-1_100_1h/borg-binpack.dat | tail -n+2 | luajit parser.lua > data/power_percentiles_binpack.txt
cut -d ' ' -f2,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,8-19 borg-1_100_1h/borg-genpack.dat | tail -n+2 | luajit parser.lua > data/power_percentiles_genpack.txt

gnuplot energy.gp