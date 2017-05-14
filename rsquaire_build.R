library(rsquaire)
library(dplyr)
library(tidyr)


listdata <- list(
  NY = list(value = -500000, Pop = 5, Stat = 10),
  AL = list(value = 5, Pop = 5, Stat = 10),
  CA = list(value = 10000000, Pop = 5, Stat = 10)
)


dfdata <- tibble::tibble(
  state = rep(c("NY", "AL", "CA"), 2),
  type = c(rep("stat1", 3), rep("stat2", 3)),
  val = c(rnorm(3, 100, 15), rnorm(3, 1000, 17))
)

widedf <- dfdata %>% tidyr::spread(type, val)


dat <- readr::read_csv("https://www2.census.gov/programs-surveys/popest/datasets/2010-2016/national/totals/nst-est2016-alldata.csv") %>%
  select(NAME, contains("popestimate"))

states <- tibble::tibble(NAME =state.name, state = state.abb)

mapdata <- dat %>%
  left_join(states, by = "NAME") %>%
  select(state, contains("popestimate")) %>%
  filter(complete.cases(.))

names(mapdata)[2:ncol(mapdata)] <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016")


  rsquaire(mapdata, tooltip = TRUE,
           index = "2016",
           column1 = "Year",
           column2 = "Population",
           colors = c('#e6eff9','#c9e2f5','#95cbee','#0098db','#0079ae'),
           whitelist = c("2010", "2014", "2016"))

  

  
  
### custom layout
  
  
  custom_layout <- ",N,\nW,,E\n,S,"
  
  custom_labels <- list(
    N = list(full = "North", short = "N"),
    E = list(full = "East", short = "E"),
    S = list(full = "South", short = "S"),
    W = list(full = "West", short = "W")
  )
  
  custom_data <- list(
    N = list(Direction = "Longitude", `Fun Fact` = "Compasses love me", note = "Also, the north star."),
    E = list(Direction = "Latitude", `Fun Fact` = "Where the sun rises"),
    S = list(Direction = "Longitude", `Fun Fact` = "Penguin citaaayy"),
    W = list(Direction = "Latitude", `Fun Fact` = "Sun goes bye-bye here")
  ) 
  
  cats <- c("Longitude", "Latitude")
  
  rsquaire(custom_data, 
           index = "Direction", 
           indexType = "string",
           categories = cats, 
           layout = custom_layout, 
           labels = custom_labels,
           colors = c("#c9e2f5","#c6e2ba"),
           labelStyle = "full")
  