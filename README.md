# rsquaire

An R interface for squaire.js, a Javascript library to create responsive equal-area square maps using d3. Default layout is U.S. map but custom layout abilities are being implemented.  

See [https://github.com/WSJ/squaire](https://github.com/WSJ/squaire) for the javascript library.

### To do

- Static tooltip not appearing
- Enable custom layouts

### Installation

```
devtools::install_github('jkassof/rsquaire')
```

#### About

Squaire.js is a javascript library that lets you make very rich equal-area square maps. You have the ability to pass `rsquare` a dataframe and color the squares by your variable of choice. You can also enable tooltips to give more contextual info as the user hovers over each state.

##### Input

`rsquaire` accepts a dataframe in "wide format." There should be a state column, and a column for each variable you want to include in the chart. These variables can be displayed through coloring or on a tooltip.

```
wide_data <- tibble::tibble(
state = state.abb,
stat1 = rnorm(50, 50, 15),
stat2 = rnorm(50, 15. 3)
)

```


#### Use


Pass the `rsquaire` function your dataframe, and indicate which column you want to base the coloring on with the `index` arguement.

```
rsquaire(wide_data, index = "stat1")
```

![](img/rsquaire.png)

<br><br>

While you can only color squares by one variable, you can include the other variables from your input data with tooltips. Use the `tooltip` arguement to enable them.

```
rsquaire(wide_data, index = "stat1", tooltip = TRUE)
```

![](img/tooltips.png)


Check out `?rsquaire` for all arguements.

