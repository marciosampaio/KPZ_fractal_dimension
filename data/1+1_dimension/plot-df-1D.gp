#!/usr/bin/gnuplot

#-------------------------------------------------------------------
#  	Graph:  df  vs  t
#
# Márcio S. Gomes-Filho (marcio@setubal.net.br)
#----------------------------------------------------------------
set terminal postscript eps enhanced  color  font 'Helvetica, 19'
set output 'dim-mult.eps'

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
set ylabel "Fractal dimension" font 'Helvetica, 20'
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set key at 1650, 1.3 spacing 1.5 
# set xrange [:30000]
set yrange [0.75:1.75]
set ytics (0.75, 1.0, 1.25, 1.5, 1.75 )


plot  "df_4096_100_2000.pdata"  w line lt 1  lc rgb '#ff0000' lw 4  t "d_f",  1.5 w  l dt 2 lw 4 lc rgb "black" notitle, "dn_4096_100_2000.pdata"  w line lt 1  lc rgb 'blue' lw 4  t "d_n",  1.0 w  l dt 2 lw 4 lc rgb "black" notitle
