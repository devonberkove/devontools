
# devontools

<!-- badges: start -->
<!-- badges: end -->

![devontools logo](images/logo.png)

## Overview

The package `devontools` is the culmination of the STAT 306 project package at Bucknell. 
It includes a normalizing function, a custom theme function, and a vignette. 

## Installation

The package can be installed through Github using `devtools` in the following way:

``` r
install.packages(devtools)
devtools::install_github("github_username/devontools")
```

In order to work, make sure to replace `github_username` with your own Github username.

## Functions

### `normalize()`

The function `normalize()` calculates an attribute's group totals for a 
specified numeric attribute, and optionally adds a proportion column 
representing the proportion of each of the numeric column's contribution
to the group's total.

The following is an example on how to use the function: 

``` r
library(devontools)

df <- data.frame(
  major = c("History", "Math", "Math", "Chemistry", "History", "Math"),
  students = c(15, 25, 40, 20, 15, 20)
  )

# Find totals for students in each major
normalize(df, major, students)

# Find proportion of students in observation compared to all students in the major
normalize(df, major, students, prop_column = TRUE)
```

### `devon_theme()`

The function `devon_theme()` applies a custom theme to plots in `ggplot2`. 
It adds an off white background to the graphs, blue text, and makes grid lines
thinner for all graphs. There are also optional arguments for the type of graph
and if the user wants to keep the legend. In particular, specifying 
`plot_type = "bar"` will get rid of the vertical grid lines.

The following is an example on how to use the function:

``` r
library(devontools)

df <- data.frame(
  teachers = c(6, 7, 4, 8, 2),
  students = c(30, 29, 32, 57, 32),
  subjects = c("Math", "Science", "Math", "Math", "Science")
  )

# Apply base theme to graph
ggplot2::ggplot(df, ggplot2::aes(x = teachers, y = students)) +
  ggplot2::geom_point() +
  devon_theme()

# Apply to bar chart to get rid of vertical grid lines
ggplot2::ggplot(df, ggplot2::aes(x = teachers)) +
  ggplot2::geom_bar() +
  devon_theme(plot_type = "bar")

# Apply to bar chart to get rid of vertical grid lines and legend
ggplot2::ggplot(df, ggplot2::aes(x = subjects, fill = subjects)) +
  ggplot2::geom_bar() +
  devon_theme(plot_type = "bar", remove_legend = TRUE)
```

Each function also has further documentation which explains them in more detail.

## Vignette 

The package contains a helpful vignette which goes into depth on how the 
functions work and in what scenarios they would be useful. To better understand
each function, it is recommended that the user go through this vignette. 

## Theme

The package also contains a custom theme, organized in a brand.yml file. 
It is roughly inspired by the color palette of the Premier League, with the 
main color being the Chelsea blue (hex code #034694), and secondary colors
being a light blue (hex code #73B9EE), a dark green (hex code #005C35), 
and a dark purple (hex code #38003c). For some contrast, the colors black
and an off white (hex code #F9FAF6) are added too. These colors were also 
put through an accessibility check with the off white as the background,
and all but the light blue passed all accessibility checks with a score of 
AA or better. However, the light blue should be used sparingly and is the 
last color used in plots. 
