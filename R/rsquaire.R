#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
rsquaire <- function(data,
                     keyCol = NULL,
                     valueCol = NULL,
                     index = "value",
                     indexType = "numeric",
                     labelStyle = c("short", "full", "ap"),
                     colors = c("#c9e2f5","#0098db"),
                     tooltip = TRUE,
                     column1 = "",
                     column2 = "",
                     whitelist = names(data[[1]]),
                     mode = c("dynamic", "static", "toggle"),
                     noteIndex = FALSE,
                     width = NULL, 
                     height = NULL, 
                     elementId = NULL) {

  labelStyle = labelStyle[1]
  mode = mode[1]
  
  if (is.list(data)) {
    cat("You provided a list, creating widget")
  } else if (is.data.frame(data)) {
    cat("You provided a data frame, attempting to convert to list")
  } else {
    stop("Data must be a list or dataframe")
  }
  
    options <- list(
      colors = colors,
      index = index,
      labelStyle = labelStyle,
      tooltip = list(
        enabled = tooltip,
        mode = mode,
        column1 = column1,
        column2 = column2,
        whitelist = whitelist,
        noteIndex = noteIndex
      )
    )
  
  # forward options using x
  x = list(
    data = data,
    options = options
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rsquaire',
    x,
    width = width,
    height = height,
    package = 'rsquaire',
    elementId = elementId
  )
}

#' Shiny bindings for rsquaire
#'
#' Output and render functions for using rsquaire within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rsquaire
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rsquaire-shiny
#'
#' @export
rsquaireOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'rsquaire', width, height, package = 'rsquaire')
}

#' @rdname rsquaire-shiny
#' @export
renderRsquaire <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rsquaireOutput, env, quoted = TRUE)
}
