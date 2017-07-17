set term postscript monochrome eps enhanced 22
set output "trace_dynamic.eps"
load "../styles.inc"
set size 1,0.65
set tmargin 2.5
set lmargin 8
set bmargin 3.5
set xlabel "Time"
set yrange [0:105]
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
set ylabel "Running Jobs"
#set y2tics 295,5,305
#set key samplen 0.5 width -1.5 invert height 0 above horizontal
set title "Google Borg Trace (sampling: 1/100)"
set origin 0,0
plot \
   	'data/trace_dynamic_simple_gnuplot_data.txt' using 1:($4) w l ls 1 axes x1y1 notitle 'Borg Jobs'
!epstopdf "trace_dynamic.eps"
!rm "trace_dynamic.eps"
quit

#'trace_dynamic_simple_gnuplot_data.txt' using ($2) ls 20 fillstyle solid 0.15 title "Joining",\
#'' using ($3) ls 20 fillstyle solid 0.35 title "Leaving",\
