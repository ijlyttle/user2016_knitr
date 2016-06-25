## Outline for Knitr tutorial at UseR 2016

### Part 1: An intro to R Markdown

0. Reminder about literate programming and Markdown

1. Pandoc's markdown syntax

   - YAML metadata
   - LaTeX math
   - tables
   - raw HTML/LaTeX
   - footnotes
   - citations
   - syntax highlighting

2. R Markdown output formats

   - HTML, PDF, Word, presentations, ...
   - Process: Rmd -> (knitr) -> md -> (pandoc) -> output
   - rmarkdown package does the whole thing

3. Customizing output

   - Basic format options: TOC, numbered sections, `self-contained`,
     `fig_height`, ...
   - Customize CSS for HTML output
     - ioslides example re slide numbers
   - Cusstomize LaTeX preample for PDF output
   - Pandoc templates
     - rticles examples
   - Customize Word templates (header/footer, font styles, ...)

### Part 2: New output formats

1. Closer look at structure of output format object

   - knitr options (chunk options, hooks, etc)
   - pandoc options
   - pre/post-processor functions

2. Examples of new formats

   - `html_vignette`, tufte package (`tufte::tufte_html()`,
     `tufte::tufte_handout()`)
   - Long-form documents using bookdown
     - cross-references of figures/tables/sections
     - separate HTML pages for chapters

### Part 3: Other applications

1. HTML widgets

2. Shiny apps within R Markdown

3. Run code from other languages (C, C++, Python, ...)
