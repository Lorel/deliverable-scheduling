set term postscript color eps enhanced 22
set output "containers.eps"
load "../styles.inc"

set size 1,0.65
set bmargin 3
set tmargin 2
set lmargin 8
set rmargin 5

set grid x front
set xtics ("0" 0,"30m" 1800,"1h" 3600,"1h30m" 5400,"2h" 7200) offset 0,0.25
set xrange [0:7200]

set grid y
set autoscale y

#set style fill transparent solid 0.5 noborder
set style fill transparent pattern 4 bo

set style data lines
set style function filledcurves y1=0

set ylabel "Total containers per gen." offset 1,0
set xlabel "Trace Replay Time" offset 0,0.25
set yrange [0:]
set key outside sample 1.0 horizontal top center
plot \
  'data/borg-genpack.dat' using 1:($6) with filledcurves x1 lw 3 lc rgb "gold" title 'nursery', \
  'data/borg-genpack.dat' using 1:($7) with filledcurves x1 lw 3 lc rgb "forest-green" title 'young', \
  'data/borg-genpack.dat' using 1:($8) with filledcurves x1 lw 3 lc rgb "dark-violet" title 'old'

!epstopdf "containers.eps"
!rm "containers.eps"
quit
