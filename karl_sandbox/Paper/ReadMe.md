## Journal article example

Several versions of a single journal article (a
[paper of mine from 2012](http://www.ncbi.nlm.nih.gov/pubmed/22384398))
as R Markdown.

- [`ailprob.Rmd`](ailprob.Rmd) - Basic R Markdown version
- [`ailprob_dblsp_linenum.Rmd`](ailprob_dblsp_linenum.Rmd) - Version
  using [`mypreamble.tex`](mypreamble.tex) to get line numbering,
  double-spaced, and section titles as san serif font
- [`ailprob_wtemplate.Rmd`](ailprob_wtemplate.Rmd) - Version using
  [`template.tex`](template.tex) as template, to use separate
  formatting of the author name and affiliation
- [`ailprob_jss/ailprob_jss.Rmd`](ailprob_jss/ailprob_jss.Rmd) -
  Version using the JSS template from [rticles](https://github.com/rstudio/rticles)


Additional files:
- [`ailprob.bib`](ailprob.bib) - Bibtex file with bibliography
- [`genetics.bst`](genetics.bst) - Bibtex style file for [Genetics](http://www.genetics.org)
- [`Makefile`](Makefile) - A GNU Make file for the first three
  versions of the article
- [`Calculations`](Calculations) - Some R code and results, used in
  the figure in the paper.
