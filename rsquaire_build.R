library(rsquaire)

data <- list(
  NY = list(value = -500000, Pop = 5, Stat = 10),
  AL = list(value = 5, Pop = 5, Stat = 10),
  CA = list(value = 10000000, Pop = 5, Stat = 10)
)

rsquaire(data)


## ideal function call

# rsquaire(data, colors = c("#c9e2f5","#0098db"), tooltip = TRUE)

