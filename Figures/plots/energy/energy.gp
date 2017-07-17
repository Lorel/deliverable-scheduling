set term postscript monochrome eps enhanced 22
set output "energy.eps"
load "../styles.inc"

# 1x4 graphs
NX=4
NY=1
# Size of graphs
SX=0.45
SY=0.5
# Margins
MX=0.1
MY=0.05
# Space between graphs
IX=0.01
IY=0.0
# Space for legends
LX=0.05
LY=0.00

set size 2,0.66

set lmargin MX
set rmargin MX+1

set tmargin MY
set bmargin MY # +0.1

set multiplot

set origin MX+LX+0*(IX+SX),MY+0*(IY+SY)+LY+0.02
set size SX,SY

set grid x y front
set ylabel "Power (Watt)" offset 0.5,0
set yrange [85:125]
unset xtics
set key horizontal samplen 1 outside 
set title "Random"

plot \
  	'data/power_percentiles_random.txt' every 20 using 1:($6/1000) with filledcurves x1 ls 2001 fillstyle solid 0.1  notitle "Max",\
	'data/power_percentiles_random.txt' every 20 using 1:($5/1000) with filledcurves x1 ls 2001 fillstyle solid 0.25 notitle "75^{th}",\
	'data/power_percentiles_random.txt' every 20 using 1:($4/1000) with filledcurves x1 ls 2001 fillstyle solid 0.5  notitle "50^{th}",\
	'data/power_percentiles_random.txt' every 20 using 1:($3/1000) with filledcurves x1 ls 2001 fillstyle solid 0.85 notitle "25^{th}",\
	'data/power_percentiles_random.txt' every 20 using 1:($2/1000) with filledcurves x1 ls 2001 fillstyle solid 0.0  notitle "Min"

set origin MX+LX+1*(IX+SX),MY+0*(IY+SY)+LY+0.02
set size SX,SY
unset ylabel
set title "Spread"
set key horizontal samplen 1 outside
set ytics ("" 85,"" 90,"" 95,"" 100,"" 105, "" 110, "" 115,"" 120)
plot \
  	'data/power_percentiles_spread.txt' every 20 using 1:($6/1000) with filledcurves x1 ls 2001 fillstyle solid 0.1  title "Max",\
	'data/power_percentiles_spread.txt' every 20 using 1:($5/1000) with filledcurves x1 ls 2001 fillstyle solid 0.25 title "75^{th}",\
	'data/power_percentiles_spread.txt' every 20 using 1:($4/1000) with filledcurves x1 ls 2001 fillstyle solid 0.5  title "50^{th}",\
	'data/power_percentiles_spread.txt' every 20 using 1:($3/1000) with filledcurves x1 ls 2001 fillstyle solid 0.85 notitle "25^{th}",\
	'data/power_percentiles_spread.txt' every 20 using 1:($2/1000) with filledcurves x1 ls 2001 fillstyle solid 0.0  notitle "Min"


set origin MX+LX+2*(IX+SX),MY+0*(IY+SY)+LY+0.02
set size SX,SY
set title "BinPack"
set key horizontal samplen 1 outside left 
plot \
  	'data/power_percentiles_binpack.txt' every 20 using 1:($6/1000) with filledcurves x1 ls 2001 fillstyle solid 0.1  notitle "Max",\
	'data/power_percentiles_binpack.txt' every 20 using 1:($5/1000) with filledcurves x1 ls 2001 fillstyle solid 0.25 notitle "75^{th}",\
	'data/power_percentiles_binpack.txt' every 20 using 1:($4/1000) with filledcurves x1 ls 2001 fillstyle solid 0.5  notitle "50^{th}",\
	'data/power_percentiles_binpack.txt' every 20 using 1:($3/1000) with filledcurves x1 ls 2001 fillstyle solid 0.85 title "25^{th}",\
	'data/power_percentiles_binpack.txt' every 20 using 1:($2/1000) with filledcurves x1 ls 2001 fillstyle solid 0.0  title "Min"
	 		                  

set origin MX+LX+3*(IX+SX),MY+0*(IY+SY)+LY+0.02
set size SX,SY
set title "GenPack"
plot \
  	'data/power_percentiles_genpack.txt' every 20 using 1:($6/1000) with filledcurves x1 ls 2001 fillstyle solid 0.1  notitle "Max",\
	'data/power_percentiles_genpack.txt' every 20 using 1:($5/1000) with filledcurves x1 ls 2001 fillstyle solid 0.25 notitle "75^{th}",\
	'data/power_percentiles_genpack.txt' every 20 using 1:($4/1000) with filledcurves x1 ls 2001 fillstyle solid 0.5  notitle "50^{th}",\
	'data/power_percentiles_genpack.txt' every 20 using 1:($3/1000) with filledcurves x1 ls 2001 fillstyle solid 0.85 notitle "25^{th}",\
	'data/power_percentiles_genpack.txt' every 20 using 1:($2/1000) with filledcurves x1 ls 2001 fillstyle solid 0.0  notitle "Min"
 		                  

		 		                  
!epstopdf "energy.eps"
!rm "energy.eps"
quit