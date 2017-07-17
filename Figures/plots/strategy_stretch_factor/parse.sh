#!/bin/bash
rm data/stretch_avg_stdev.dat 
touch data/stretch_avg_stdev.dat 
echo "#strategy mean-30 stdev-30 mean-60 stdev-60 mean-90 stdev-90 mean-120 stdev-120 mean-150 stdev-150"  >> data/stretch_avg_stdev.dat  
echo -n "binpack " >> data/stretch_avg_stdev.dat  
cat raw_data/30_binpack.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat  
cat raw_data/60_binpack.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat  
cat raw_data/90_binpack.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat  
cat raw_data/120_binpack.dat | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat  
cat raw_data/150_binpack.dat | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat  
echo " " >> data/stretch_avg_stdev.dat  
echo -n "custom " >> data/stretch_avg_stdev.dat  
cat raw_data/30_dumb.dat     | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/60_dumb.dat     | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/90_dumb.dat     | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/120_dumb.dat    | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/150_dumb.dat    | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
echo " " >> data/stretch_avg_stdev.dat  
echo -n "random " >> data/stretch_avg_stdev.dat  
cat raw_data/30_random.dat   | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/60_random.dat   | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/90_random.dat   | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/120_random.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/150_random.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
echo " " >> data/stretch_avg_stdev.dat  
echo -n "spread " >> data/stretch_avg_stdev.dat  
cat raw_data/30_spread.dat   | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/60_spread.dat   | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/90_spread.dat   | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/120_spread.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat
cat raw_data/150_spread.dat  | lua stats.lua | xargs printf "%s " >> data/stretch_avg_stdev.dat