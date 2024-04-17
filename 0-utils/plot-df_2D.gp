#!/usr/bin/gnuplot

#-------------------------------------------------------------------
#  	Graph:  df  vs  t         inset: for a short time period
#
# Author: Márcio S. Gomes-Filho (marcio@setubal.net.br)
#------------------------------------------------------------------

set terminal postscript eps enhanced  color  font 'Helvetica, 19'
set output '2+1.eps'

# set border lw 2 lc rgb "blue"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"
set tics nomirror
set border 3

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set style data line
set size 1,1.2
set multiplot         # Plot with inset 
# #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set xlabel "t"  font 'Helvetica, 20'
# set ylabel "d_f" font 'Helvetica, 19'
set ylabel "fractal dimension" font 'Helvetica, 20'

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set size 1,0.6
set origin 0, 0.6
set key at 15000, 1.9
# set yrange [0.9:1.8]
set xrange [0:5e4]
 set key  spacing 1.5 
# set key at 0.4, 1.35 
set yrange [1.61: ]
# set xtics (10000, 20000, 30000, 40000, 50000)
set label 1 "(a)" at 10000, 1.7 font 'Helvetica, 17'
#  a               = 1.60651          +/- 0.001333     (0.083%)
a = (1+sqrt(5))/2.

plot  "alphat_4096_5_3.pdata" us ($1):(2-$2) w line lt 1  lc rgb '#ff0000' lw 4  t "d_f", "alphat_4096_5_3.pdata" us ($1):(1.0/$2 - 1) w line lt 1  lc rgb 'blue' lw 4  t "d_n", a w  l dt 2 lw 4   lc 0 notitle
# ,  1.618 w  l dt 2 lw 2 notitle
# , "df1t.pdata"  w line lt 2 lc 0 lw 6 t "d = 1"


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#			INSET
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
unset label
set xlabel " "
set ylabel " "
set xrange [3e4:5e4]
set xtics (30000, 40000, 50000) font "Helvetica,18"
set ytics (1.614, 1.618, 1.622) font "Helvetica,18"
#  set xtics (2, 2000)  font "Helvetica,25"

# set key
set size 0.6, 0.4 
set origin 0.4, 0.8
# plot  "df2t.pdata"  w line lt 1  lc rgb '#00008b' lw 6  t "d = 2", "df1t.pdata"  w line lt 10 lc rgb  '#006400' lw 6 t "d = 1"
# plot  "df2t.pdata"  w line lt 1  lc rgb '#ff0000' lw 6  t "d = 2", "df1t.pdata"  w line lt 1 lc 0 lw 6 t "d = 1"

plot  "alphat_4096_5_3.pdata" us ($1):(2-$2) w line lt 1  lc rgb '#ff0000' lw 4  t "d_f", "alphat_4096_5_3.pdata" us ($1):(1.0/$2 - 1) w line lt 1  lc rgb 'blue' lw 4  t "d_n", a w  l dt 2 lw 4   lc rgb '#400080' notitle
# 
reset
# set border lw 2 lc rgb "blue"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"
set tics nomirror
set border 3


set size 1,0.6
set origin 0.,0.0
# #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set xlabel "t"  font 'Helvetica, 20'
set ylabel "d_f - d_n" font 'Helvetica, 20'
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# set yrange [0.9:1.8]
set key left
# set xrange [0:1]
# # set key at 0.5, 1.2 box spacing 1.5 
# set key at 0.4, 1.35 
# set yrange [1.60:1.7]
# set xtics (10000, 20000, 30000, 40000, 50000)
# set label 1 "(a)" at 0.1, 1.5 font  "Times-Italic,26"
#  a               = 1.60651          +/- 0.001333     (0.083%)
# set ytics (1.6, 1.65) font "Helvetica,18"
set xrange [0:5e4]
set label 1 "(b)" at 10000, -0.18 font 'Helvetica, 17'

f(x)=a
fit [3e4:5e4] f(x) "dif-fractal.dat" us 1:2 via a

plot "dif-fractal.dat" us 1:2 w l lc 0 lw 4 notitle, 0 w  l dt 2 lw 4  lc rgb "orangered3" notitle, [3e4:5e4]  f(x) w  l lt 1 lw 4  lc rgb "blue" notitle
# , "alphat_4096_5_3.pdata" us ($1):(1.0/$2 - 1) w line lt 1  lc rgb 'blue' lw 4  t "d_i", a w  l dt 2 lw 2  lc 0 notitle
# w line lt 1  lc rgb 'black' lw 6  notitle
# , "df1t.pdata"  w line lt 2 lc 0 lw 6 t "d = 1"

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#			INSET
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
unset label
set xlabel " "
set ylabel " "
set xrange [3e4:5e4]
set xtics (30000, 40000, 50000) font "Helvetica,18"
set ytics (-0.003, 0, 0.002) font "Helvetica,18"
#  set xtics (2, 2000)  font "Helvetica,25"

# set key
set size 0.6, 0.38 
set origin 0.4, 0.1
# plot  "df2t.pdata"  w line lt 1  lc rgb '#00008b' lw 6  t "d = 2", "df1t.pdata"  w line lt 10 lc rgb  '#006400' lw 6 t "d = 1"
# plot  "df2t.pdata"  w line lt 1  lc rgb '#ff0000' lw 6  t "d = 2", "df1t.pdata"  w line lt 1 lc 0 lw 6 t "d = 1"


plot "dif-fractal.dat" us 1:2 w l lc 0 lw 4 notitle, 0 w  l dt 2 lw 4  lc rgb "orangered3" notitle, f(x) w  l lt 1 lw 4  lc rgb "blue" notitle

# 


unset multiplot 

# !epstopdf dim-mult.eps
