#!/bin/bash

cat borg-1_100_1h/stopping-datas-random.log | awk -F ' ' {'print $1,$5'} | sed 's/:/ /g'  | awk '{ $5 = $2 - $4} 1' | ../gen_cdf.rb -c 5 > data/cdf_completion_random.txt
cat borg-1_100_1h/stopping-datas-spread.log | awk -F ' ' {'print $1,$5'} | sed 's/:/ /g'  | awk '{ $5 = $2 - $4} 1' | ../gen_cdf.rb -c 5 > data/cdf_completion_spread.txt
cat borg-1_100_1h/stopping-datas-binpack.log| awk -F ' ' {'print $1,$5'} | sed 's/:/ /g'  | awk '{ $5 = $2 - $4} 1' | ../gen_cdf.rb -c 5 > data/cdf_completion_binpack.txt

cat borg-1_100_1h/stopping-datas-genpack.log| awk -F ' ' {'print $1,$5'} | sed 's/:/ /g'  | awk '{ $5 = $2 - $4} 1' | ../gen_cdf.rb -c 5 > data/cdf_completion_genpack.txt

gnuplot completion.gp