#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rsquaire)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("rsquaire demo"),
  tags$style("svg {
  float: left;
             }"),
    rsquaireOutput("rsquairetest")
)

dfdata <- tibble::tibble(
  state = rep(c("NY", "AL", "CA"), 2),
  type = c(rep("stat1", 3), rep("stat2", 3)),
  val = c(rnorm(3, 100, 15), rnorm(3, 1000, 17))
)

widedf <- dfdata %>% tidyr::spread(type, val)

server <- function(input, output) {
  output$rsquairetest <-
    renderRsquaire(rsquaire(
      widedf,
      index = "stat1",
      tooltip = TRUE,
      mode = "static"
    ))
  
}

# Run the application
shinyApp(ui = ui, server = server)
