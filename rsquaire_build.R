library(devtools)
setup()
library(htmlwidgets)
scaffoldWidget('rsquaire')


data <- list(
  NY = list(value = 5),
  AL = list(value = 1),
  CA = list(value = 10)
)

options <- list(
  colors = "d3.scale.quantize().domain([1,5]).range(['#c9e2f5','#0098db'])",
  el = "'#' + el.id"
)
