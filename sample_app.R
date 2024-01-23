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
      div(
        class = "scrollable-tabs", # Add this class
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

## ui <- fluidEuTheme(
##   selectInput(
##     "education",
##     "What is the highest level of education that you have completed?",
##     c(
##       "ISCED 0: Early childhood education",
##       "ISCED 1: Primary education",
##       "ISCED 2: Lower secondary education",
##       "ISCED 3: Upper secondary education",
##       "ISCED 4: Post-secondary non-tertiary education",
##       "ISCED 5: Short-cycle tertiary education",
##       "ISCED 6: Bachelor’s or equivalent level",
##       "ISCED 7: Master’s or equivalent level",
##       "ISCED 8: Doctoral or equivalent level"
##     ),
##     width = "100%"
##   ),
##   radioButtons(
##     "working",
##     "Are you currently working?",
##     c(
##       "Yes",
##       "No, I am a full-time student",
##       "No, I am on a temporary sick leave",
##       "No, I am permanently disabled",
##       "No, I am unemployed",
##       "No, I am retired",
##       "No, I don’t want/need to work"
##     ),
##     width = "100%"
##   ),
##   conditionalPanel(
##     condition = "input.working != 'Yes'",
##     radioButtons(
##       "workedBefore",
##       "Have you worked before?",
##       c("Yes", "No"),
##       width = "100%"
##     )
##   ),
##   conditionalPanel(
##     condition = "input.working == 'Yes' || input.workedBefore == 'Yes'",
##     textInput(
##       "occupation",
##       "What is your current or last occupation?",
##       width = "100%"
##     ),
##     radioButtons(
##       "employmentType", "Do you work on your own or for a company?",
##       c(
##         "I am self-employed and I don’t have any employees",
##         "I am self-employed and I have employees",
##         "I am an employee, but I also do some activities on my own",
##         "I am an employee"
##       ),
##       width = "100%"
##     ),
##     conditionalPanel(
##       condition = "input.employmentType == 'I am self-employed and I have employees'",
##       numericInput(
##         "numEmployees",
##         "How many employees do you have?",
##         value = 1,
##         width = "100%"
##       )
##     ),
##     textInput(
##       "monthlyWage",
##       "What is your monthly wage net of taxes?",
##       width = "100%"
##     ),
##     numericInput(
##       "careerInterruptions",
##       "Approximately, how many career interruptions have you experienced?",
##       value = 0,
##       min = 0,
##       width = "100%"
##     ),
##     conditionalPanel(
##       condition = "input.careerInterruptions > 0",
##       numericInput(
##         "childrenInterruptions",
##         "How many of the total interruptions were to take care of children or other relatives?",
##         value = 0,
##         min = 0,
##         width = "100%"
##       ),
##       numericInput(
##         "unemploymentInterruptions",
##         "How many of the total interruptions were due to unemployment?",
##         value = 0,
##         min = 0,
##         width = "100%"
##       )
##     ),
##     checkboxGroupInput(
##       "propertySavings",
##       "Do you have any property or savings?",
##       choices = list(
##         "None",
##         "I own the house where I live",
##         "I own additional property",
##         "I have savings from my own income",
##         "I have savings from inheritances or donations"
##       ),
##       width = "100%"
##     )
##   ),
##   numericInput(
##     "age",
##     "How old are you?",
##     value = NA,
##     min = 0,
##     width = "100%"
##   ),
##   radioButtons(
##     "gender", "What is your gender?",
##     c("Female", "Male", "Non-binary", "A gender not listed here"),
##     width = "100%"
##   ),
##   selectInput(
##     "countryBirth", "In which country were you born?",
##     c("Country 1", "Country 2", "Country 3"),
##     width = "100%"
##   ), # Replace with actual country list
##   selectInput(
##     "countryResidence", "In which country do you currently live?",
##     c("Country 1", "Country 2", "Country 3"),
##     width = "100%"
##   )
## )

## server <- function(input, output) {
##   output$responses <- renderPrint({
##     responses <- list(
##       Education = input$education,
##       Working = input$working,
##       WorkedBefore = input$workedBefore,
##       Occupation = input$occupation,
##       EmploymentType = input$employmentType,
##       NumberOfEmployees = input$numEmployees,
##       MonthlyWage = input$monthlyWage,
##       CareerInterruptions = input$careerInterruptions,
##       ChildrenInterruptions = input$childrenInterruptions,
##       UnemploymentInterruptions = input$unemploymentInterruptions,
##       PropertySavings = input$propertySavings,
##       Age = input$age,
##       Gender = input$gender,
##       CountryOfBirth = input$countryBirth,
##       CountryOfResidence = input$countryResidence
##     )
##     responses
##   })
## }

## shinyApp(ui = ui, server = server)
