set terminal pngcairo size 800,600
set output 'q4b.png'

set title "Age vs Blood Pressure"
set xlabel "Age"
set ylabel "Blood Pressure (trestbps)"
set grid

plot 'age_vs_bp.dat' using 1:2 with points pointtype 7 pointsize 1 title "Data Points"

