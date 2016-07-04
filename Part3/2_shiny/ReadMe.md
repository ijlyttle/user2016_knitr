# Shiny

We can incorporate shiny into R Markdown documents. 

The biggest thing to keep in mind is that we need to keep a running R session, either running locally or on a Shiny server.

The file `demo.Rmd` is generated using RStudio > File > New File > R Markdown... > Shiny

## Website

We can make a website using R Markdown and Shiny - two steps:

* put `runtime: shiny` into each Rmd yml block

* change the `href` items in the nav part of `_site.yml` to point to the `.Rmd` files instead of `.html` files




