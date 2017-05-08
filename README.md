
<p align="center">
  <img src="img/rsquarelogo.png">
</p>

An R interface for squaire.js, a JavaScript library to create responsive equal-area square maps using d3. Default layout is U.S. map but custom layout abilities are being implemented.  

See [https://github.com/WSJ/squaire](https://github.com/WSJ/squaire) for the JavaScript library.

### To do

- Static tooltip shiny test
- ~~Implement custom layouts~~
    - NSEW custom working
- ~~Add more d3 colorscales functionality~~
    - Added quantize and ordinal scales. Still need quantiles

### Installation

```
devtools::install_github('jkassof/rsquaire')
```

### About

Squaire.js is a JavaScript library that lets you make very rich equal-area square maps. `rsquaire` is an `htmlwidgets` based R wrapper for that library. Only the default U.S. state map layout is available but custom layouts are coming soon. 

### Input

`rsquaire` accepts a dataframe in wide format. There should be a state column, and a column for each variable you want to include in the graphic. These variables can be displayed through coloring or on a tooltip.

```
wide_data <- tibble::tibble(
state = state.abb,
stat1 = rnorm(50, 50, 15),
stat2 = rnorm(50, 15. 3)
)

```


### Use


Pass the `rsquaire` function your dataframe, and indicate which column you want to base the coloring on with the `index` argument.

```
rsquaire(wide_data, index = "stat1")
```

![](img/rsquaire.png)

<br><br>

You can include the other variables from your input data with tooltips. Use the `tooltip` argument to enable them. `whitelist` tells the widget which variables to include on the tooltip, by default it will include all columns except 'state.'

```
rsquaire(wide_data, index = "stat1", tooltip = TRUE)
```

![](img/tooltips.png)


Check out `?rsquaire` for all arguments.

### Attribution

The squaire.js library was created by [Wall Street Journal's Graphics Team](https://github.com/WSJ)

