set term postscript color eps enhanced 22
set output "jobs_duration.eps"
load "../styles.inc"
set size 1,0.65
set bmargin 3
set tmargin 2
set lmargin 8
set rmargin 5
set title "Google Borg Trace - Job Duration" offset 0,-0.5
set ylabel "CDF (%)"
set xlabel "Duration"
set grid y
set ytics 0,20,100
set yrange [0:100]
set xrange [0:3000]
set xtics 0,300,3000
set xtics ("0" 0, "10m" 600,"20m" 1200,"30m" 1800,"40m" 2400, "50m" 3000)
set key bottom right samplen 1 width 1

plot \
     'data/cdf_duration_jobs.txt'  u ($1):($6*100)\
          w l ls 5 notitle '',\
     'data/cdf_duration_jobs.txt'  u ($1):($6*100) every 100\
          w p ls 5 notitle '',\
	  10000\
		   w lp ls 5 notitle 'Job duration'


!epstopdf "jobs_duration.eps"
!rm "jobs_duration.eps"
quit
