#' Create a customized Shiny UI with additional CSS and HTML
#'
#' This function extends a Shiny UI by adding custom CSS and HTML from the
#' \code{inst/www/} directory of the \code{eutheme} package.
#'
#' @param ... Arguments passed to \code{\link[shiny]{div}} function.
#'
#' @return A \code{shiny.semantic::semanticPage} object with custom styling.
#' @export
#'
#' @examples
#' \dontrun{
#' library(shiny)
#' library(shiny.semantic)
#'
#' ui <- fluidEutheme(
#'   tabset(
#'     tabs = list(
#'       list(
#'         menu = "Tab 1",
#'         content = "hey",
#'         id = "first_tab"
#'       )
#'     )
#'   )
#' }
#' @seealso \code{\link[shiny]{addResourcePath}}, \code{\link[shiny]{includeHTML}}
fluidEuTheme <- function(...) {
  # Add custom CSS and HTML from inst/www/
  shiny::addResourcePath("custom_css", system.file("www", package = "eutheme"))
  header_html <- shiny::includeHTML(system.file("www/header.html", package = "eutheme"))
  footer_html <- shiny::includeHTML(system.file("www/footer.html", package = "eutheme"))

  shiny.semantic::semanticPage(
    margin = "0px",
    header_html,
    shiny::div(class = "content", ...),
    footer_html
  )
}
