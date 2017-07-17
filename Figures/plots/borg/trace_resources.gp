set term postscript color eps enhanced 22
set output "trace_resources.eps"
load "../styles.inc"
set size 1,0.65
set tmargin 2.5
set lmargin 8
set bmargin 3.5
set xlabel "Time"
set yrange [0:80]
#set ylabel "Leaves and join\nper second"
set ytics nomirror
set xrange [0:43200]
#set xtics 0,10000,100000
set xtics ("0" 0, "2h" 7200,"4h" 14400,"6h" 21600,"8h" 28800,"10h" 36000,"12h" 43200,"14h" 50400)
#set x2range [0:598]
set grid x
set style data histograms
set style histogram rowstacked
set boxwidth 15 relative
set style fill solid 1.0 border 0
#set y2range [285:307]

set style line 1001 lt 1 lc '#3aa6dd' lw 4 pt 9 ps 1.8
set style line 1002 lt 1 lc '#c92d39' lw 4 pt 11 ps 1.8

set ylabel "Memory (GB)" textcolor ls 1001
set y2label "CPU (cores)" textcolor ls 1002
set y2tics
set y2range [0:40]
#set y2tics 295,5,305
#set key samplen 0.5 width -1.5 invert height 0 above horizontal
set title "Google Borg Trace - Demanded Resources"
set origin 0,0
set key samplen 1
plot \
   	'data/resources_distribution.dat' using 1:($3) w l ls 1002 axes x1y2 notitle 'CPU',\
 	'data/resources_distribution.dat' using 1:($2) w l ls 1001 axes x1y1 notitle 'Memory'

!epstopdf "trace_resources.eps"
!rm "trace_resources.eps"
quit
