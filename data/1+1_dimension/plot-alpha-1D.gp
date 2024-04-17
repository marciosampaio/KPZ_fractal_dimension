#!/usr/bin/gnuplot

#-------------------------------------------------------------------
#  	Graph:   alpha  vs  t
#
# Márcio S. Gomes-Filho (marcio@setubal.net.br)
#----------------------------------------------------------------

set terminal postscript eps enhanced  color  font 'Helvetica, 19'
set output 'alpha1d.eps'

# set border lw 2 lc rgb "blue"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"
# set tics nomirror
# set border 3

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set style data line
set size 1,1.
# set multiplot         # Plot with inset 
# #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set xlabel "t"  font 'Helvetica, 20'
set ylabel "Roughness exponent: {/ Symbol  a}" font 'Helvetica, 20'
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# set key at 2.4e4, 1.3  spacing 1.5 
# set xrange [:30000]
set yrange [0.15:.55]
set key bottom

plot  "alphat_4096_100_2000.pdata"  w line lt 1  lc rgb '#ff0000' lw 4  t "1+1", 0.5 w  l dt 2 lw 4 lc rgb "black" notitle

