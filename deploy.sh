#!/usr/bin/env bash
# knits docs and pushs

R -e 'rmarkdown::render("index.Rmd")'
R -e 'rmarkdown::render("cheatsheet/intro-r-cheatsheet.Rmd")'
git push