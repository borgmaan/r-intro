#!/usr/bin/env bash
# knits docs and pushs

Rscript -e 'rmarkdown::render("index.Rmd")'
Rscript -e 'rmarkdown::render("cheatsheet/intro-r-cheatsheet.Rmd")'
Rscript -e 'rmarkdown::render("lesson/intro-r.Rmd")'
