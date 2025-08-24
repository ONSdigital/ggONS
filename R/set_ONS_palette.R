#' Set ONS base R plotting palette
#'
#' @param palette Name of palette. See \code{names(ONScolours)}. Run
#' \code{palette("default")} to reset.
#' @export

set_ONS_palette <- function(palette) {
  palette_choice <- ONScolours[[palette]]
  if (is.null(palette_choice) || is.numeric(palette)) {
    stop("Palette does not exist. Use names(ONScolours) to find valid palette.")
  }
  grDevices::palette(palette_choice[[1]])
}
