#' List of colours.
#'
#' Complete list of palettes.
#' Use names(ONScolours) to return all palette names.
#' @export
ONScolours <- list(
  categorical = list(
    c(
      "#206095", "#27A0CC", "#871A5B", "#A8BD3A", "#F66068",
      "#003C57", "#22D0B6", "#746CB1", "#118C7B", "#A09FA0"
    ),
    type = "qual"
  ),
  categorical_text = list(
    c(
      "#206095", "#1F80A3", "#871A5B", "#6E7E26", "#F66068",
      "#003C57", "#1AA590", "#746CB1", "#118C7B", "#8D8C8E"
    ),
    type = "qual"
  ),
  pos_neg = list(c("#206095", "#F66068"),
    type = "qual"
  ),
  mf = list(c("#2EA1A4", "#6749A6", "#9A86E9"),
    type = "qual"
  )
)

#' Define global colours
#' @export
ocean_blue <- "#206095"

#' Define global colours
#' @export
sky_blue <- "#27A0CC"

#' Define global colours
#' @export
beetroot_purple <- "#871A5B"

#' Define global colours
#' @export
spring_green <- "#A8BD3A"

#' Define global colours
#' @export
coral_pink <- "#F66068"

#' Define global colours
#' @export
night_blue <- "#003C57"

#' Define global colours
#' @export
mint_green <- "#22D0B6"

#' Define global colours
#' @export
lavendar_purple <- "#746CB1"

#' Define global colours
#' @export
emerald_green <- "#118C7B"

#' Define global colours
#' @export
grey_50 <- "#A09FA0"

#' Define global colours
#' @export
grey_60 <- "#8D8C8E"

#' ONS palettes
#' Generates the colour palettes
#' @param palette_name Name of Palette.
#' @param n Number of desired colours. If number of requested colours is beyond the scope
#' of the palette, colours are automatically interpolated.
#' @param type The type of palette. One of c("discrete", "continuous").
#' @return A vector of colours.
#' @export
ONSpalettes <- function(palette_name,
                        n,
                        type = c("discrete", "continuous")) {
  palette <- ONScolours[[palette_name]][[1]]
  if (missing(n)) {
    n <- length(palette)
  }
  type <- match.arg(type)
  out <- switch(type,
    continuous = grDevices::colorRampPalette(palette)(n),
    discrete = palette[1:n]
  )
  structure(out,
    palette_name = palette_name,
    class = "palette"
  )
}


# Function for printing palette
#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- graphics::par(mar = c(0, 0, 0, 0))
  on.exit(graphics::par(old))
  graphics::image(1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )
  graphics::rect(0, 0.92, n + 1, 1.08,
    col = grDevices::rgb(0, 0, 0, 0.6),
    border = NA
  )
  graphics::text((n + 1) / 2, 1,
    labels = attr(x, "palette_name"),
    cex = 1.5,
    family = "sans",
    col = grDevices::rgb(1, 1, 1, 1)
  )
}

#' Function for printing all palettes
#' @return A plot of all available palettes
#' @export
view_all_palettes <- function() {
  oldpar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(oldpar))
  graphics::par(mfrow = c(ceiling(length(names(ONScolours)) / 2), 2))
  purrr::map(.x = names(ONScolours), .f = ~ print(ONSpalettes(.x)))
}

#' Function to change colours in ggplot for discrete variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_colour_manual}
#' @export
scale_colour_ONS_d <- function(palette_name, ...) {
  ggplot2::scale_colour_manual(
    values = ONSpalettes(palette_name,
      type = "discrete"
    ), ...
  )
}

#' Function to change colours in ggplot for discrete variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_colour_manual}
#' @export
scale_color_ONS_d <- scale_colour_ONS_d


#' Function to change fill in ggplot for discrete variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_fill_manual}
#' @export
scale_fill_ONS_d <- function(palette_name, ...) {
  ggplot2::scale_fill_manual(
    values = ONSpalettes(palette_name,
      type = "discrete"
    ), ...
  )
}

#' Function to change colours in ggplot for continuous variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_colour_gradientn}
#' @export
scale_colour_ONS_c <- function(palette_name, ...) {
  ggplot2::scale_colour_gradientn(colours = ONSpalettes(
    palette_name = palette_name,
    type = "continuous"
  ), ...)
}

#' Function to change colours in ggplot for continuous variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_colour_gradientn}
#' @export
scale_color_ONS_c <- scale_colour_ONS_c

#' Function to change fill in ggplot for continuous variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_fill_gradientn}
#' @export
scale_fill_ONS_c <- function(palette_name, ...) {
  ggplot2::scale_fill_gradientn(colours = ONSpalettes(
    palette_name = palette_name,
    type = "continuous"
  ), ...)
}
