set terminal pngcairo size 800,600
set output 'q4c.png'

set title "Age vs Cholesterol for Individuals Without Heart Disease"
set xlabel "Age"
set ylabel "Cholesterol"
set grid

plot 'age_vs_chol.dat' using 1:2 with linespoints pointtype 7 pointsize 1 linecolor "blue" title "No Heart Disease"

