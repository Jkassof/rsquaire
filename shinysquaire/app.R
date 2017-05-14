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
  titlePanel("Shiny rsquaire demo"),

  sidebarLayout(
    sidebarPanel("Inputs Here"),
    mainPanel(
      rsquaireOutput("rsquairetest", width = "90%")
  )
)
)

dat <- readr::read_csv("https://www2.census.gov/programs-surveys/popest/datasets/2010-2016/national/totals/nst-est2016-alldata.csv") %>%
  select(NAME, contains("popestimate"))

states <- tibble::tibble(NAME =state.name, state = state.abb)

mapdata <- dat %>%
  left_join(states, by = "NAME") %>%
  select(state, contains("popestimate")) %>%
  filter(complete.cases(.))

names(mapdata)[2:ncol(mapdata)] <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016")


server <- function(input, output) {
  output$rsquairetest <-
    renderRsquaire(rsquaire(
      mapdata,
      tooltip = TRUE,
      mode = "static",
      index = "2016",
      column1 = "Year",
      column2 = "Population",
      colors = c('#e6eff9','#c9e2f5','#95cbee','#0098db','#0079ae')
    ))
  
}

# Run the application
shinyApp(ui = ui, server = server)
