#!/usr/bin/env bash
set -euo pipefail

# Find all resume.md files and process them
find . -type f -name "resume.md" -print0 | while IFS= read -r -d '' md; do
  dir="$(dirname "$md")"
  html_out="$dir/resume.html"
  pdf_out="$dir/resume.pdf"
  docx_out="$dir/resume.docx"

  echo "Processing '$md' -> '$html_out', '$pdf_out', '$docx_out'"

  # Determine CSS to use for HTML
  css_arg=""
  if [ -f "$dir/style.css" ]; then
    css_arg="--css=$dir/style.css"
  elif [ -f "./style.css" ]; then
    css_arg="--css=$(pwd)/style.css"
  fi

  # HTML (with CSS if found)
  pandoc "$md" -f markdown -t html -s -o "$html_out" $css_arg

  # PDF (needs LaTeX)
  pandoc "$md" -f markdown -t html -s -o "$pdf_out"

  # Word (DOCX)
  pandoc "$md" -f markdown -t docx -s -o "$docx_out"
done
