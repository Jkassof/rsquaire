#' rsquaire
#'
#' Produces an htmlwidget of a equal-area square cartogram
#' 
#' @param data A dataframe in "wide format." One variable of the dataframe will need to be named
#' 'state' and contain state abbrevations. Each other variable is a statistic about that state.
#' 
#' @param index A string which tells rsquaire which variable to use for the map coloring
#' @param labelStyle A string indicating which type of label to use on the map. Default options are
#'  "short", "full," and "ap."
#' @param colors A character vector of color hex codes you want to use for map coloring
#' @param tooltip A boolean indicating if you want responsive tooltips enabled
#' @param mode A string indicating which type of tooltip you want
#' @param column1 A string to label the first column of your tooltip
#' @param column2 A string to label the second column of your tooltip
#' @param whitelist A character vector of column names from your dataframe to include in your tooltip
#'
#' @import htmlwidgets
#'
#' @export
rsquaire <- function(data,
                     index = NULL,
                     indexType = "numeric",
                     labelStyle = c("short", "full", "ap"),
                     colors = c("#CFF09E","#A8DBA8","#79BD9A","#3B8686","#0B486B"),
                     tooltip = FALSE,
                     column1 = "",
                     column2 = "",
                     whitelist = NULL,
                     mode = c("dynamic", "static", "toggle"),
                     noteIndex = NULL,
                     width = NULL, 
                     height = NULL) {

  
  assertthat::assert_that(labelStyle %in% c("short", "full", "ap"))
  assertthat::assert_that(mode %in% c("dynamic", "static", "toggle"))
  
  labelStyle = labelStyle[1]
  mode = mode[1]
  
  assertthat::assert_that("state" %in% names(data))
  
  if (is.null(whitelist)) whitelist <- dplyr::setdiff(names(data), "state")
  
  index_min <- min(data[, index])
  index_max <- max(data[, index])
  
  assertthat::assert_that(is.data.frame(data))
    stopifnot("state" %in% names(data))
    cat("Converting data frame to JSON friendly list")
    data <- tod3list(data)
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
    options = options,
    indexmin = index_min,
    indexmax = index_max
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rsquaire',
    x,
    width = width,
    height = height,
    package = 'rsquaire',
    elementId = "map-container"
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

tod3list <- function(df) {
  d3data <- vector("list", nrow(df))
  states <- df[['state']]
  names(d3data) <- states
  stat_names <- setdiff(names(df), "state")
  data <- df[stat_names]
  
  for (i in seq_along(states)) {
    state <- states[i]
    d3data[[state]] <- vector("list", length(stat_names))
    names(d3data[[state]]) <- stat_names
    for(j in seq_along(stat_names)) {
      stat <- stat_names[j]
      d3data[[state]][stat] <- data[[i, j]]
    }
  }
  d3data
}
