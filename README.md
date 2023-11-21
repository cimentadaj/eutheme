
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eutheme

<!-- badges: start -->
<!-- badges: end -->

The goal of eutheme is to …

## Installation

You can install the development version of eutheme from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cimentadaj/eutheme")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(eutheme)
library(shiny)
library(shiny.semantic)
library(ggplot2)

ui <- fluidEutheme(
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
