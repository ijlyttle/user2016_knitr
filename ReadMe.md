## Outline for Knitr tutorial at UseR 2016

See [Etherpad](https://public.etherpad-mozilla.org/p/user2016_knitr)
for notes during the tutorial, or to ask questions.

### Part 1: An intro to R Markdown

0. Reminder about literate programming and Markdown

1. Pandoc's markdown syntax

   - YAML metadata
   - LaTeX math
   - syntax highlighting
   - raw HTML/LaTeX
   - tables
   - footnotes
   - citations

2. R Markdown output formats

   - HTML, PDF, Word, presentations, ...
   - Process: Rmd -> (knitr) -> md -> (pandoc) -> output
   - rmarkdown package does the whole thing

3. Customizing output

   - Basic format options: TOC, numbered sections, `self-contained`,
     `fig_height`, themes, ...
   - Customize CSS for HTML output
     - ioslides example re slide numbers
   - Customize LaTeX preample for PDF output
   - Pandoc templates
   - Customize Word templates (header/footer, font styles, ...)

### Part 2: New output formats

1. Closer look at structure of output format object

   - knitr options (chunk options, hooks, etc)
   - pandoc options
   - pre/post-processor functions

2. Examples of new output formats

   - `html_vignette`, `rtf_document`
   -  tufte package (`tufte::tufte_html()`,
     `tufte::tufte_handout()`)
   - Long-form documents using [bookdown](https://bookdown.org)
     - cross-references of figures/tables/sections
     - separate HTML pages for chapters

### Part 3: Other applications

1. Journal articles ([rticles](https://github.com/rstudio/rticles))

2. Build websites

3. HTML widgets

4. Shiny apps within R Markdown

5. Run code from other languages (C, C++, Python, ...)
