<!-- badges: start -->
  [![R-CMD-check](https://github.com/nrennie/ggONS/workflows/R-CMD-check/badge.svg)](https://github.com/nrennie/ggONS/actions)
<!-- badges: end -->

# ggONS 

This R package contains:

* scale and theme functions for use with {ggplot2};
* template for revealjs Quarto presentations;

## Installation

This package is not currently on CRAN, so cannot be installed directly with `install.packages()`. Instead, use `pak` to install. Start by installing `pak`:

```r
install.packages("pak")
```

## Method 1: Directly from GitHub

Then install `ggONS` from GitHub:

```r
pak::pkg_install("ONSdigital/ggONS")
```

## Method 2: Local installation

Alternatively, go to [github.com/ONSdigital/ggONS](https://github.com/ONSdigital/ggONS), and click on the green **Code** button to download a zip file of the package. This will download a file called `ggONS-main.zip`. Unzip the file.

Then use `pak` to install locally:

```r
pak::local_install("C:/Users/username/Downloads/ggONS-main/ggONS-main")
```

Make sure the file path is correct, and points to the unzipped folder.

## Examples

Load 'ggplot2' and 'ggONS':

```r
library(ggplot2)
library(ggONS)
```

### Single colour

Use `ocean_blue` if only requiring one colour:

```r
ggplot(
  data = mpg,
  mapping = aes(y = reorder(class, class, function(x) length(x)))
) +
  geom_bar(fill = ocean_blue) +
  labs(x = "Number of vehicles") +
  theme_ONS() 
```

![](man/figures/example1.png)

### Multiple colours

```r
library(gapminder)
gapminder |> 
  dplyr::group_by(year, continent) |> 
  dplyr::summarise(meanLifeExp = mean(lifeExp)) |> 
  dplyr::ungroup() |> 
  ggplot(
    mapping = aes(x = year, y = meanLifeExp, colour = continent)
  ) +
  geom_line() +
  # Use colour scale with categorical palette
  scale_colour_ONS_d() +
  # Use tag instead of `y` for horizontal orientation
  labs(x = NULL, tag = "Average life expectancy") +
  theme_ONS() 
```

![](man/figures/example2.png)
