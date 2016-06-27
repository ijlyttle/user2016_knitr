# Part 1:

1. About Yihui...

   - slides: http://bit.ly/2016rmd
   - examples: https://github.com/ijlyttle/user2016_knitr

2. Intermediate R Markdown: assuming you've used Rmd and knitr for
   some basic reports

   If not, this is probably not the best tutorial for you.

   - current version of RStudio and R
   - LaTeX installation ([MacTex](https://tug.org/mactex/) for Mac;
     [MiKTeX](http://miktex.org/download) for Windows)
   - `install.packages("devtools")`
   - download the [git repo](https://github.com/ijlyttle/user2016_knitr) as a zip file

3. Reminder about literate programming and Markdown

4. Pandoc markdown

   - YAML metadata
   - LaTeX math
   - syntax highlighting
   - raw HTML/LaTeX
   - tables
   - footnotes
   - citations

  [example: yihui's pandoc-markdown.Rmd; particularly discuss the bibtex file and pandoc-based citations]


2. R Markdown output formats

   - HTML, PDF, Word, presentations, ...
   - Process: Rmd -> (knitr) -> md -> (pandoc) -> output
   - rmarkdown package does the whole thing

3. Basic format options

   [Fruit snacks example]

   - try the little gear in R Markdown
   - look at help file for rmarkdown::html_document

   - toc: yes
   - number_sections: yes
   - self_contained: yes [emphasize importance for talks]
   - code_folding: "hide" (and remove "echo=FALSE")

4. Customize CSS for HTML output

   [fruit snacks slides]

   - plain
   - get rid of total number of slides, using CSS within doc
   - get rid of total number of slides, using separate CSS file
   - describe how I figured it out
     - Chrome developer tools -> Elements tab -> `::after` thing
       (style on right)
     - find `default.css` in ioslides template

5. Customize LaTeX preample for PDF output

   [AILprob paper]

   - basic Rmd-based paper
   - Use LateX preamble to add line numbers and make double-spaced
     (also section headings with sans serif font)
   - use LateX template to deal with author name/institution separately

6. Journal articles: rticles package

   - use JSS template for the AIL prob paper

7. Customize word template

   - Customize Word templates (header/footer, font styles, ...)
