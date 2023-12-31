
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eutheme

The `eutheme` package is a Shiny theme that wraps the European Union
design theme. It was built to be compatible with `shiny.semantic`.
However, this package is focused exclusively on the EU Project
[DIGCLASS](https://joint-research-centre.ec.europa.eu/tools-and-laboratories/centre-advanced-studies/digclass_en)
so it has properties exclusive to that project.

## Installation

You can install the development version of `eutheme` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cimentadaj/eutheme")
```

## Example

You can use the package by simply wrapping your Shiny app with
`fluidEuTheme`:

``` r
library(eutheme)
library(shiny)
library(shiny.semantic)

ui <- fluidEuTheme(
  tabset(
    tabs = list(
      list(
        menu = "Tab 1",
        content = "hey",
        id = "first_tab"
      )
    )
  )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
```
