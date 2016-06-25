## Customizing Word output

- Use `output: word_document` and knit the file

- Modify the various styles (e.g., fonts for text and titles) in that
  file and then use "save as" and some other name (e.g.,
  `template.docx`)

- In the Rmd file, use the following in the YAML header:

  ```
  output:
    word_document:
      reference_docx: template.docx
  ```
