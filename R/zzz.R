.onLoad <- function(libname, pkgname) {
  sysfonts::font_add(
    family = "Open Sans",
    regular = system.file("fonts", "OpenSans", "OpenSans-Regular.ttf", package = "ggONS"),
    italic = system.file("fonts", "OpenSans", "OpenSans-Italic.ttf", package = "ggONS"),
    bold = system.file("fonts", "OpenSans", "OpenSans-Bold.ttf", package = "ggONS"),
    bolditalic = system.file("fonts", "OpenSans", "OpenSans-BoldItalic.ttf", package = "ggONS")
  )
  showtext::showtext_auto()
  showtext::showtext_opts(dpi = 300)
}
