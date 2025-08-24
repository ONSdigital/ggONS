#' List of Quarto extensions in the package
#'
#' @return a string of available extensions for install
#' @export

available_extensions <- function() {
  list.files(system.file("extdata/_extensions", package = "ggONS"))
}
