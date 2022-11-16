.onLoad <- function(libname, pkgname) {

  fa_solid_path <- systemfonts::system_fonts() |>
    dplyr::filter(family == "Lora", style == "SemiBold") |>
    dplyr::pull(path)

  systemfonts::register_font(
    name = "Lora SemiBold",
    plain = fa_solid_path)

}
