set term postscript color eps enhanced 22
set output "generation_hosts.eps"
load "../styles.inc"

set size 1,0.65
set bmargin 3
set tmargin 2
set lmargin 8
set rmargin 5

set grid x front
set xtics ("0" 0,"30m" 1800,"1h" 3600,"1h30m" 5400,"2h" 7200) offset 0,0.25
set xrange [0:7200]
set yrange [0:12.5]
set grid y
#set autoscale y

set style fill solid 1.0

set ylabel "Active hosts" offset 1,0
set xlabel "Trace Replay Time per Generation" offset 0,0.25
set yrange [0:]
set key outside sample 1.0 horizontal top center
plot \
  'data/borg-genpack-active-nodes-by-generation.log' using ($1-1473851890):($2+$3+$4) with boxes lc rgb '#FFDF71' title 'nursery',\
  'data/borg-genpack-active-nodes-by-generation.log' using ($1-1473851890):($3+$4) with boxes lc '#A3D977' title 'young',\
  'data/borg-genpack-active-nodes-by-generation.log' using ($1-1473851890):($4) with boxes lc '#B391B5' title 'old'

!epstopdf "generation_hosts.eps"
!rm "generation_hosts.eps"
quit
