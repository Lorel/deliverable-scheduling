set term postscript color eps enhanced 22
set output "energy_joule.eps"
load "../styles.inc"
set size 1,0.6
set bmargin 2
set tmargin 2.5
set lmargin 10
set rmargin 2

#unset key
set grid y

set yrange [0:105]
set style data histogram
#set style histogram cluster gap 1
#set style histogram gap 1 lw 1
#set style fill solid border -1
set style fill solid noborder
set boxwidth 0.3
set linetype 1 lc rgb 'orange'
set linetype 2 lc rgb 'blue'
set linetype 3 lc rgb 'red'
set linetype 4 lc rgb 'black'
#set xtic rotate by -35 scale 0
#unset xtics
set title "Power Consumption (1 Hour of Borg Trace)"
set key horizontal sample 0.4 outside #at 3.5,235
set ylabel "Normalized Energy"
set ytics ("0" 0,"20\%%" 20,"40\%%" 40,"60\%%" 60,"80\%%" 80,"100\%%" 100)

set style textbox opaque noborder

set label 1001 "-4\%"  at 1,100 font "Arial,16" boxed center
set label 1002 "-9\%"  at 2,95 font "Arial,16" boxed center
set label 1003 "-23\%" at 3,81.1 font "Arial,16" boxed center

set xtics scale 0
# offset 1.75,0
set xrange [-0.5:3.5]

set palette defined (\
    1  '#394f15', \
    2  '#56781f', \
    3  '#73a228', \
    4  '#a3d977' \
    )
#set palette defined (\
#    1  '#3f6e27', \
#    2  '#549534', \
#    3  '#69bc40', \
#    4  '#a3d977' \
#    )
unset colorbox

plot "data/energy_joule.txt" u 0:($3*100):($4):xtic(1) with boxes linecolor palette notitle "30s"

!epstopdf "energy_joule.eps"
!rm "energy_joule.eps"
quit
