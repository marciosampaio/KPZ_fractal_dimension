#!/usr/bin/gnuplot

#-------------------------------------------------------------------
#  	Graph:  df  vs  t
#
# Author: Márcio S. Gomes-Filho (marcio@setubal.net.br)
#------------------------------------------------------------------

set terminal postscript eps enhanced  color  font 'Helvetica, 19'
set output '3+1.eps'

# set border lw 2 lc rgb "blue"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"
# set tics nomirror
# set border 3

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# set style data line
# set size 1,1.2
# set multiplot         # Plot with inset 
# #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set xlabel "t"  font 'Helvetica, 20'
# set ylabel "d_f" font 'Helvetica, 19'
set ylabel "fractal dimension" font 'Helvetica, 20'

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# set size 1,1.
# set origin 0, 0.6
# set key at 12000, 4.
# set yrange [0.9:1.8]
set xrange [0:1.4e4]
 set key  spacing 1.5 
# set key at 0.4, 1.35 
set yrange [1.5: 4]
# set xtics (10000, 20000, 30000, 40000, 50000)
# set label 1 "(a)" at 2000, 3.8 font 'Helvetica, 17'
#  a               = 1.60651          +/- 0.001333     (0.083%)
a = (1+sqrt(5))/2.

plot  "alphat_3_128_2_100.pdata" us ($1):(3-$2) w line lt 1  lc rgb '#ff0000' lw 4  t "d_f", "alphat_3_128_2_100.pdata" us ($1):(1.0/$2 - 1) w line lt 1  lc rgb 'blue' lw 4  t "d_n"
