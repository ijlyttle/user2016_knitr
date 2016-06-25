pdf: ailprob.pdf ailprob_dblsp_linenum.pdf

ailprob.pdf: ailprob.Rmd ailprob.bib genetics.bst
	R -e "rmarkdown::render('$(<F)')"

ailprob_dblsp_linenum.pdf: ailprob_dblsp_linenum.Rmd ailprob.bib genetics.bst mypreamble.tex
	R -e "rmarkdown::render('$(<F)')"
