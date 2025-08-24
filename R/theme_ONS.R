#' Theme for \code{ggplot2} plots
#' @param family Name of font family to use for the text in the
#' plot. Default \code{"Open Sans"}.
#' @param bg_col Background colour of plot. Default \code{"transparent"}.
#' @export

theme_ONS <- function(family = "Open Sans",
                      bg_col = "transparent") {
  ggplot2::theme_minimal(
    base_family = family,
    base_size = 13
  ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        colour = "black",
        fontface = "bold"
      ),
      plot.subtitle = ggplot2::element_text(
        colour = grey_60
      ),
      plot.caption = ggplot2::element_text(
        colour = grey_60,
        hjust = 0
      ),
      axis.text = ggplot2::element_text(
        margin = ggplot2::margin(t = 10, r = 5),
        colour = grey_60
      ),
      axis.title.x = ggplot2::element_text(
        colour = grey_60,
        hjust = 1
      ),
      plot.background = ggplot2::element_rect(
        fill = bg_col,
        colour = bg_col
      ),
      panel.background = ggplot2::element_rect(
        fill = bg_col,
        colour = bg_col
      ),
      plot.margin = ggplot2::margin(10, 10, 10, 10),
      legend.position = "top",
      legend.title = ggplot2::element_blank()
    )
}
