#!/bin/bash

Rscript -e "bookdown::render_book('.')"
Rscript -e "bookdown::serve_book('.')"
