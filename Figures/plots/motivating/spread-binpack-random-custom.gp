set term postscript color eps enhanced 16
set output "spread-binpack-random-custom.eps"
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
set tmargin 0.3
set lmargin 0
set rmargin 0

set grid x front
set xtics 0,1 offset -0.25,0.25
set xrange [0:4]

set grid y
#set autoscale y

set ylabel "Total CPU\n(ops/ns)"
set xlabel "Time (min)" offset 0,0.5
set ytics 0,10
set yrange [0:35]
unset key
plot \
  'data/spread.dat' every 5\
  	 using ($1/60):4 with lines ls 1 notitle 'spread',\
  'data/spread.dat' every 10\
  	 using ($1/60):4 with p ls 1 notitle 'spread',\
  'data/binpack.dat' every 5\
  	 using ($1/60):4 with lines ls 2 notitle 'binpack',\
  'data/binpack.dat'  every 10\
     using ($1/60):4 with p ls 2 notitle 'binpack',\
  'data/random.dat' every 5\
     using ($1/60):4 with lines ls 3 notitle 'random',\
  'data/random.dat'  every 10\
     using ($1/60):4 with p ls 3 notitle 'random',\
  'data/custom.dat' every 5\
     using ($1/60):4 with lines ls 4 notitle 'custom',\
  'data/custom.dat'  every 10\
     using ($1/60):4 with p ls 4 notitle 'custom'

unset xlabel
set xtics format ""

X_POS=0
Y_POS=1
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

set ylabel "Total memory\n(GB)"
set ytics 1
set yrange [5:9.5]
#set ylabel "memory (GB)" font "Arial, 16pt"
#set ytics ("0" 0,"5" 5000000,"10" 10000000) font "Arial, 16pt"
#set yrange [0:10000000]
plot \
  'data/spread.dat'\
   using ($1/60):($5/1000000000) with lines ls 1 notitle 'spread', \
  'data/spread.dat' every 10\
   using ($1/60):($5/1000000000) with p ls 1 notitle 'spread', \
  'data/binpack.dat'\
   using ($1/60):($5/1000000000) with lines ls 2 notitle 'binpack', \
  'data/binpack.dat' every 10\
   using ($1/60):($5/1000000000) with p ls 2 notitle 'binpack', \
  'data/random.dat'\
   using ($1/60):($5/1000000000) with lines ls 3 notitle 'random', \
  'data/random.dat' every 10\
   using ($1/60):($5/1000000000) with p ls 3 notitle 'random', \
  'data/custom.dat'\
   using ($1/60):($5/1000000000) with lines ls 4 notitle 'custom', \
  'data/custom.dat' every 10\
   using ($1/60):($5/1000000000) with p ls 4 notitle 'custom'
		  
X_POS=0
Y_POS=2
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

set ylabel "Total power\n(W)"
set ytics 100
set yrange [300:625]
plot \
  'data/spread.dat'\
   using ($1/60):($7/1000) with lines ls 1 notitle 'spread', \
  'data/spread.dat' every 10\
  	using ($1/60):($7/1000) with p ls 1 notitle 'spread', \
  'data/binpack.dat'\
  	using ($1/60):($7/1000) with lines ls 2 notitle 'binpack', \
  'data/binpack.dat' every 10\
	using ($1/60):($7/1000) with p ls 2 notitle 'binpack', \
  'data/random.dat'\
  	using ($1/60):($7/1000) with lines ls 3 notitle 'random', \
  'data/random.dat' every 10\
   using ($1/60):($7/1000) with p ls 3 notitle 'random', \
  'data/custom.dat'\
   using ($1/60):($7/1000) with lines ls 4 notitle 'custom', \
  'data/custom.dat' every 10\
   using ($1/60):($7/1000) with p ls 4 notitle 'custom'

X_POS=0
Y_POS=3
set origin X_MARGIN+(X_POS*(WIDTH_IND+WIDTH_BETWEEN_X)), Y_MARGIN+(Y_POS*(HEIGHT_IND+WIDTH_BETWEEN_Y))
set size WIDTH_IND,HEIGHT_IND

#set title "Custom vs default strategies" at 200,35
#set label 1001 "Custom vs default strategies" at 000,35 

set ylabel "Running\ncontainers"
set ytics 5
set yrange [0:22]

set key horizontal maxrows 1 samplen 1 width 1 at graph 0.5,0.2 center

plot \
  'data/spread.dat'\
   	using ($1/60):($3) with lines ls 1 notitle 'spread', \
  'data/spread.dat' every 10\
   	using ($1/60):($3) with p ls 1 notitle 'spread', \
  'data/binpack.dat'\
   	using ($1/60):($3) with lines ls 2 notitle 'binpack', \
  'data/binpack.dat' every 10\
   	using ($1/60):($3) with p ls 2 notitle 'binpack', \
  'data/random.dat'\
  	using ($1/60):($3) with lines ls 3 notitle 'random', \
  'data/random.dat' every 10\
  	using ($1/60):($3) with p ls 3 notitle 'random', \
  'data/custom.dat' \
  	using ($1/60):($3) with lines ls 4 notitle 'custom', \
  'data/custom.dat' every 10\
  	using ($1/60):($3) with p ls 4 notitle 'custom', \
  100000000\
	w lp ls 1 title 'spread',\
  100000000\
    w lp ls 2 title 'binpack',\
  100000000\
    w lp ls 3 title 'random',\
  100000000\
    w lp ls 4 title 'custom'

!epstopdf "spread-binpack-random-custom.eps"
!rm "spread-binpack-random-custom.eps"
quit
