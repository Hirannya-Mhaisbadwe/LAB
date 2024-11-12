set terminal pdf
set output 'q4b.pdf'

set title "Age vs Blood Pressure"
set xlabel "Age"
set ylabel "Blood Pressure (trestbps)"
set grid

plot 'age_vs_bp.dat' using 1:2 with points pointtype 7 pointsize 1 title "Data Points"
