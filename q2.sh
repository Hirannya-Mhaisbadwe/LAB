#!/bin/bash

# Check if input CSV file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input.csv>"
  exit 1
fi

input_csv="$1"
output_tex="${input_csv%.csv}.tex"

# Generate the LaTeX file
cat <<EOT > "$output_tex"
\\documentclass{article}
\\usepackage{booktabs} % For professional looking tables
\\usepackage{geometry} % For adjusting page layout
\\geometry{margin=1in}
\\begin{document}
\\begin{table}[h!]
\\centering
\\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}
\\hline
EOT

# Read the header and add it to the LaTeX table
header=$(head -n 1 "$input_csv")
IFS=',' read -ra cols <<< "$header"
for col in "${cols[@]}"; do
  echo -n "\\textbf{$col} & " >> "$output_tex"
done
# Remove last '&' and add '\\' for new line
sed -i '$ s/& $/\\\\ \\hline/' "$output_tex"

# Read the CSV rows and add them to the LaTeX table
tail -n +2 "$input_csv" | while IFS=',' read -r ${cols[*]}; do
  for val in "${!cols[@]}"; do
    echo -n "${!val} & " >> "$output_tex"
  done
  # Remove last '&' and add '\\' for new line
  sed -i '$ s/& $/\\\\ \\hline/' "$output_tex"
done

# Finish LaTeX table and document
cat <<EOT >> "$output_tex"
\\end{tabular}
\\end{table}
\\end{document}
EOT

echo "LaTeX file created: $output_tex"
echo "Run pdflatex on $output_tex to generate a PDF."

