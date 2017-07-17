set term postscript color eps enhanced 22
set output "completion.eps"
load "../styles.inc"
set size 1,0.65
set bmargin 3
set tmargin 2
set lmargin 8
set rmargin 5
set title "Google Borg Trace - Job Completion Time" offset 0,-0.5
set ylabel "CDF (%)"
set xlabel "Job Duration"
set grid y
set ytics 0,20,100
set yrange [0:100]
set xrange [0:2000]
#set xtics 0,300
#set xtics ("0" 0, "10m" 600,"20m" 1200,"30m" 1800,"40m" 2400, "50m" 3000)
set xtics ("0" 0, "10m" 600,"20m" 1200,"30m" 1800,"40m" 2400, "50m" 3000)
set key bottom right samplen 1 width 1

plot \
     'data/cdf_completion_random.txt'  u ($1):($6*100)\
          w l ls 3 notitle '',\
     'data/cdf_completion_random.txt'  u ($1):($6*100) every 20\
          w p ls 3 notitle '',\
      'data/cdf_completion_spread.txt'  u ($1):($6*100)\
           w l ls 1 notitle '',\
      'data/cdf_completion_spread.txt'  u ($1):($6*100) every 20\
           w p ls 1 notitle '',\
      'data/cdf_completion_binpack.txt'  u ($1):($6*100)\
           w l ls 2 notitle '',\
      'data/cdf_completion_binpack.txt'  u ($1):($6*100) every 20\
           w p ls 2 notitle '',\
      'data/cdf_completion_genpack.txt'  u ($1):($6*100)\
           w l ls 4 notitle '',\
      'data/cdf_completion_genpack.txt'  u ($1):($6*100) every 20\
           w p ls 4 notitle '',\
	  10000\
		   w lp ls 3 title 'random',\
 	  10000\
 		   w lp ls 2 title 'spread',\
  	  10000\
  		   w lp ls 1 title 'binpack',\
   	  10000\
   		   w lp ls 4 title 'genpack'
		   
		   
		   


!epstopdf "completion.eps"
!rm "completion.eps"
quit
