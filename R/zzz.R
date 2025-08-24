.onLoad <- function(libname, pkgname) {
  sysfonts::font_add(
    family = "Open Sans",
    regular = system.file("fonts", "Open Sans", "OpenSans-Regular.ttf", package = "ggONS"),
    italic = system.file("fonts", "Open Sans", "OpenSans-Italic.ttf", package = "ggONS"),
    bold = system.file("fonts", "Open Sans", "OpenSans-Bold.ttf", package = "ggONS"),
    bolditalic = system.file("fonts", "Open Sans", "OpenSans-BoldItalic.ttf", package = "ggONS")
  )
  showtext::showtext_auto()
  showtext::showtext_opts(dpi = 300)
}
