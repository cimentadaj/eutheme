#' Create a customized Shiny UI with additional CSS and HTML
#'
#' This function extends a Shiny UI by adding custom CSS and HTML from the
#' \code{inst/www/} directory of the \code{eutheme} package.
#'
#' @param title Title of the Shiny App
#' @param ... Arguments passed to \code{\link[shiny]{div}} function.
#'
#' @return A \code{shiny::fluidPage} object with custom styling.
#' @export
fluidEuTheme <- function(title, ...) {
  # Add custom CSS and HTML from inst/www/
  shiny::addResourcePath("custom_css", system.file("www", package = "eutheme"))
  header_html <- shiny::includeHTML(system.file("www/header.html", package = "eutheme"))
  footer_html <- shiny::includeHTML(system.file("www/footer.html", package = "eutheme"))
  digclass_html <- shiny::includeHTML(system.file("www/digclass_logo.html", package = "eutheme"))

  shiny::fluidPage(
    title = title,
    shiny::tags$style(shiny::HTML(
      "
      .container-fluid {
        margin-right: 0px;
        margin-left: 0px;
        padding-right: 0px;
        padding-left: 0px;
      }
      .radioMatrixInput .radio-matrix-buttons-label {
        width: 80% !important;
      }
      .my-body {
        display: flex;
        align-items: start; /* Align items to the start (top) of the container */
        flex-direction: column;
        width: 95%; /* Default width for mobile */
        margin: 40px auto; /* Center the container */
        font-size: 18px; /* Adjust font size here */
        text-align: left; /* Align text to the left */
      }
      /* For tablets (medium screens): min-width 768px */
      @media (min-width: 768px) {
        .my-body {
          width: 75%;
        }
      }
      /* For computer screens (large screens): min-width 992px */
      @media (min-width: 992px) {
        .my-body {
          width: 45%;
        }
      }
      }")),
      header_html,
      digclass_html,
      shiny::div(class = "my-body", ...),
      footer_html
  )
}
