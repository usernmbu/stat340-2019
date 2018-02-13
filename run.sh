#!/bin/bash

Rscript -e "bookdown::render_book('.', output_format = 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('.', output_format = 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('.', output_format = 'bookdown::epub_book')"
