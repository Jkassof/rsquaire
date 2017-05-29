
<p align="center">
  <img src="img/rsquarelogo.png">
</p>

An R interface for squaire.js, a JavaScript library to make responsive equal-area square maps using d3. The default layout of squares is a U.S. map. You can color the squares based on a variable, and create tooltips to provide more info. The [rsquaire website](http://jkassof.com/rsquaire) has a few examples that demonstrate the features available in `rsquaire`.

The Javascript library was created by [Wall Street Journal's Graphics Team](https://github.com/WSJ)

### Installation

```
devtools::install_github('jkassof/rsquaire')
```

### Input

`rsquaire` accepts a dataframe in wide format. If using the default layout, there needs to be a "state" column, and a column for each variable you want to have available to the widget. These variables can be displayed through coloring or on a tooltip.

```
wide_data <- data.frame(
  state = state.abb,
  var1 = rnorm(50, 50, 15),
  var2 = rnorm(50, 15. 3),
  var3 = c("Rep", "Dem", "Dem")
)

```


### Use


`index` is the only required argument as it tells `rsquaire` which variable to color the squares by. See `?rsquaire` for details of all argument.

```
rsquaire(wide_data, index = "stat1")
```

<img src='img/rsquaire.png' width = "400">

<br><br>

To include other variables, enabled tooltips with the `tooltip` argument. `whitelist` tells the widget which variables to include in the tooltip, by default it will include all columns except "state."

```
rsquaire(wide_data, index = "stat1", tooltip = TRUE)
```

<img src = 'img/tooltips.png' width = "400")


Check out `?rsquaire` for all arguments.

### Attribution

The squaire.js library was created by [Wall Street Journal's Graphics Team](https://github.com/WSJ)

### To do

- Custom html tooltip layouts
