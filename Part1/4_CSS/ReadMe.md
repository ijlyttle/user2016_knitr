### Example of "ioslides" presentation

- [`fruitsnacks_slides0.Rmd`](fruitsnacks_slides0.Rmd) is the plain version; each slide has both
  the slide number and the total number of slides. I want to
  **remove** the total number of slides. (Never want the audience to
  know where we stand.)  Note that the second slide has a `div` and
  `img`, to get the centered image and set its width.

- [`fruitsnacks_slides1.Rmd`](fruitsnacks_slides1.Rmd) includes a bit of CSS right at the top.
  (See also
  [this related github issue](https://github.com/rstudio/rmarkdown/issues/244).)

- [`fruitsnacks_slides2.Rmd`](fruitsnacks_slides2.Rmd) uses an option in the YAML header to
  include the [`no_total_slides.css`](no_total_slides.css) file.

Here's how I originally figured out the slide number thing:

- Opened the slides in Chrome, and used the Elements tab of the Chrome
  Developer Tools to see that the slide number info comes from some
  `::after` thing.

- On the right, you can see the styles that are attached to that
  object, `slides > slide:not(.nobackground):after { }`

- Looked at the [default.css](https://github.com/rstudio/rmarkdown/blob/master/inst/rmd/ioslides/ioslides-13.5.1/theme/css/default.css#L302-L309)
  file for the ioslides template at <github.com/rstudio/rmarkdown>.
