# File for testing currently being called from a Makefile

devtools::load_all()
library(shiny)
library(shiny.semantic)

ui <- fluidEuTheme(
  titlePanel("Hello Shiny!"),
  sidebar_layout(
    sidebar_panel(
      sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500),
      width = 3
    ),
    main_panel(
      tags$head(
        tags$style(HTML("
          /* Scrollable tab container */
          .scrollable-tabs {
            overflow-x: auto;
            white-space: nowrap;
          }
          /* Individual tabs */
          .scrollable-tabs .item {
            display: inline-block;
            float: none;
          }
          /* Minimum width for plot container */
          #plotContainer {
            min-width: 1200px; /* Adjust this value as needed */
          }
        "))
      ),
      div(class = "scrollable-tabs", # Add this class
        tabset(
          list(
            list(menu = "Some tab1", content = div(id = "plotContainer", plotOutput("distPlot"))),
            list(menu = "Some tab1", content = plotOutput("distPlot")),
            list(menu = "Some tab2", content = plotOutput("distPlot"))
          )
        )
      )
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
}

shinyApp(ui, server)

## library(shiny)

## shiny::addResourcePath("custom_css", system.file("www", package = "eutheme"))
## header_html <- shiny::includeHTML(system.file("www/header.html", package = "eutheme"))
## footer_html <- shiny::includeHTML(system.file("www/footer.html", package = "eutheme"))
## digclass_html <- shiny::includeHTML(system.file("www/digclass_logo.html", package = "eutheme"))

## ui <- fluidPage(
##   tags$style(HTML("
##     .container-fluid {
##      margin-right: 0px;
##      margin-left: 0px;
##      padding-right: 0px;
##      padding-left: 0px;
## }")),
##   header_html,
##   digclass_html,
##   shinysurveys::surveyOutput(
##     df = shinysurveys::teaching_r_questions,
##     survey_title = "A minimal title",
##     survey_description = "A minimal description",
##     theme = "white"
##   ),
##   footer_html
## )

## server <- function(input, output, session) {
## }

## shiny::shinyApp(ui = ui, server = server)
