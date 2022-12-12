.onLoad <- function(libname, pkgname) {

  # Register Lora SemiBold font
  lora_sb_path <- systemfonts::system_fonts() |>
    dplyr::filter(family == "Lora", style == "SemiBold") |>
    dplyr::pull(path)

  systemfonts::register_font(
    name = "Lora SemiBold",
    plain = lora_sb_path)

  # Register Inter Regular font
  inter_reg_path <- systemfonts::system_fonts() |>
    dplyr::filter(family == "Inter", style == "Regular") |>
    dplyr::pull(path)

  systemfonts::register_font(
    name = "Inter Regular",
    plain = inter_reg_path)

}
