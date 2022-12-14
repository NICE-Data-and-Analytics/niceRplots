#' @importFrom rlang .data
.onLoad <- function(libname, pkgname) {

  # Register Lora SemiBold font
  lora_sb_path <- systemfonts::system_fonts() |>
    dplyr::filter(.data$family == "Lora", .data$style == "SemiBold") |>
    dplyr::pull(.data$path)

  systemfonts::register_font(
    name = "Lora SemiBold",
    plain = lora_sb_path)

  # Register Inter Regular font
  inter_reg_path <- systemfonts::system_fonts() |>
    dplyr::filter(.data$family == "Inter", .data$style == "Regular") |>
    dplyr::pull(.data$path)

  systemfonts::register_font(
    name = "Inter Regular",
    plain = inter_reg_path)

}
