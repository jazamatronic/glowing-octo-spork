# Gnuplot tips n tricks

## first line are column headers
set key autotitle columnhead 

## what are your comments?
set datafile commentschar "%"

## see what the current output is
show terminal  

## plot to a new figure
set terminal x11 1
set terminal x11 2

## to plot to a file
set terminal png
set output "filename"

## some examples:

db/results/reports/dynamic\_domain\_currents:  
time    GND     VDD     VSS  
5        0.0008694263941         0.0007308705451          0.000540191632  
10         0.00138208762           0.00121617599         0.0009418759824  

## plots time vs (GND + VSS) and time vs VDD
plot 'db/results/reports/dynamic\_domain\_currents' using 1:($2 + $4) with lines, \'\' using 1:3 with lines

## change the ranges
set xrange [-10:10]
set yrange [0:20]

## plot with a straight line
plot "datafile", x


