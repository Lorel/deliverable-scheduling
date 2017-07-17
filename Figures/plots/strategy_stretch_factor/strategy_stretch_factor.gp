set term postscript color eps enhanced 22
set output "strategy_stretch_factor.eps"
load "../styles.inc"
set size 1,0.6
set bmargin 2
set tmargin 2.5
set lmargin 8
set rmargin 2

#unset key
set grid y

set yrange [0:210]
set style data histogram
#set style histogram cluster gap 1
set style histogram errorbars gap 1 lw 1
set style fill solid border -1
set boxwidth 0.9
#set xtic rotate by -35 scale 0
#unset xtics
set title "avg/stdev job duration"
set key horizontal sample 0.4 outside at 3.5,235
set ylabel "Seconds"
set ytics ("0" 0, "30" 30,"60" 60,"90" 90,"120" 120,"150" 150,"180" 180,"210" 210)
#set key horizontal width 1.0 sample 0.2  spacing 1 at 5,-1.5 #could not place it elsewhere...

plot "data/stretch_avg_stdev.dat" u  2:3:xtic(1) ls 105 title "30s",\
     "data/stretch_avg_stdev.dat" u  4:5:xtic(1) ls 125 title "60s",\
     "data/stretch_avg_stdev.dat" u 6:7:xtic(1) ls 150 title "90s",\
     "data/stretch_avg_stdev.dat" u 8:9:xtic(1) ls 175 title "120s",\
     "data/stretch_avg_stdev.dat" u 10:11:xtic(1) ls 190 title "150s"
							  
!epstopdf "strategy_stretch_factor.eps"
!rm "strategy_stretch_factor.eps"
quit
