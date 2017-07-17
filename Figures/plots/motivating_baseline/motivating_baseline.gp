set term postscript color eps enhanced 16
set output "motivating_baseline.eps"
load "../styles.inc"

X_MARGIN=0.1
Y_MARGIN=0.02
WIDTH_IND=0.53
HEIGHT_IND=0.28
WIDTH_BETWEEN_X=0.03
WIDTH_BETWEEN_Y=-0.05

set size 0.65,1

set multiplot #layout 4, 1

set ytics format "%3h" offset 0.5,0
set ylabel offset 1.5,0

X_POS=0
Y_POS=0
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

unset title
set bmargin 2
set tmargin 0.2
set lmargin 0
set rmargin 0

set grid x front
set xtics 0,1 offset -0.25,0.25
set xrange [0:4]

set grid y
#set autoscale y

set ylabel "Total CPU\n(ops/ns)"
set xlabel "Time (min)" offset 0,0.5
set ytics 0,1
set yrange [0:3.5]
unset key
#This plot uses an hack to print values bigger than 0
plot \
  'data/random.dat' every 1\
     using ($1/60):($4>0?$4:1/0) with l ls 3 notitle 'random' ,\
  'data/random.dat' every 1\
     using ($1/60):($4>0?$4:1/0) with p ls 3 notitle 'random',\
  10000\
    w lp ls 3 title 'random'

unset xlabel
set xtics format ""

X_POS=0
Y_POS=1
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

set ylabel "Total memory\n(GB)"
set ytics 0,1
set yrange [0:3.2]
plot \
  'data/random.dat'\
   using ($1/60):($5/1000) with lines ls 3 notitle 'random', \
  'data/random.dat' every 10\
   using ($1/60):($5/1000) with p ls 3 notitle 'random', \
  100000000\
    w lp ls 3 title 'random'

X_POS=0
Y_POS=2
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

set ylabel "Total power\n(W)"
set ytics 85,5
set yrange [83:103]
plot \
  'data/random.dat'\
  	using ($1/60):($7/1000) with lines ls 3 notitle 'random', \
  'data/random.dat' every 10\
   using ($1/60):($7/1000) with p ls 3 notitle 'random', \
  100000000\
     w lp ls 3 title 'random'

X_POS=0
Y_POS=3
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

set label 1001 "cpu-heavy" at graph 0.125,0.85 center
set label 1002 "mem-heavy" at graph 0.875,0.85 center

set ylabel "Running\ncontainers"
set ytics 0,1
set yrange [0:1.5]

set key horizontal maxrows 1 samplen 1 width 1 at 280,2.2

plot \
  'data/random.dat'\
   	using ($1/60):($3) with lines ls 3 notitle 'random', \
  'data/random.dat' every 10\
   	using ($1/60):($3) with p ls 3 notitle 'random', \
  100000000\
	w lp ls 3 notitle 'random'

!epstopdf "motivating_baseline.eps"
!rm "motivating_baseline.eps"
quit
