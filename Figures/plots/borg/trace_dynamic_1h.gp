set term postscript monochrome eps enhanced 22
set output "trace_dynamic_1h.eps"
load "../styles.inc"
set size 1,0.65
set tmargin 2.5
set lmargin 8
set bmargin 3.5
set xlabel "Time"
set yrange [0:105]
#set ylabel "Leaves and join\nper second"
set ytics nomirror
set xrange [0:3600]
#set xtics 0,10000,100000
set xtics ("0" 0, "30mn" 1800,"1h" 3600)
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
!epstopdf "trace_dynamic_1h.eps"
!rm "trace_dynamic_1h.eps"
quit

#'trace_dynamic_simple_gnuplot_data.txt' using ($2) ls 20 fillstyle solid 0.15 title "Joining",\
#'' using ($3) ls 20 fillstyle solid 0.35 title "Leaving",\
