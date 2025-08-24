#' Install bundled Quarto extensions into current working directory
#' https://github.com/jthomasmock/octavo/blob/master/R/use_quarto_ext.R
#' @param file_name Name of new qmd file
#' @param ext_name String indicating which extension to install
#' @param use_template Boolean indicating if template file should be copied
#' @param open Boolean indicating whether or not to open new file. Default FALSE
#' @return a message if extension was successfully copied over
#' @export

use_quarto_ext <- function(file_name = NULL,
                           ext_name = "ONSstyle",
                           use_template = TRUE,
                           open = FALSE) {
  # check for available extensions
  stopifnot("Extension not in package" = ext_name %in% c("ONSstyle"))

  # check for existing _extensions directory
  if (!file.exists("_extensions")) {
    dir.create("_extensions")
    message("Created '_extensions' folder")
  }

  # Create folder for recursive copying into ahead of time
  if (!file.exists(paste0("_extensions/", ext_name))) {
    dir.create(paste0("_extensions/", ext_name))
  }

  # copy from internals
  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name), package = "ggONS"),
    to = paste0("_extensions/"),
    overwrite = TRUE,
    recursive = TRUE,
    copy.mode = TRUE
  )

  # logic check to make sure extension files were moved
  n_files <- length(dir(paste0("_extensions/", ext_name)))

  if (n_files >= 2) {
    message(paste(ext_name, "was installed to _extensions folder in current working directory."))
  } else {
    message("Extension appears to not have been created")
  }

  # create new qmd report based on skeleton
  if (use_template) {
    readLines(file.path("_extensions", ext_name, "template.qmd")) %>%
      writeLines(con = paste0(file_name, ".qmd", collapse = ""))
  }

  # open the new file in the editor if desired
  if (open) {
    utils::file.edit(paste0(file_name, ".qmd", collapse = ""))
  }
}
