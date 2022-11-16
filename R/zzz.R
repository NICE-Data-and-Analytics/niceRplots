.onLoad <- function(libname, pkgname) {
  
  sysfonts::font_add("Inter-Regular","data/Inter-Regular.ttf")
  
  sysfonts::font_add("Inter-SemiBold","data/Inter-SemiBold.ttf")
  
  sysfonts::font_add("Lora-SemiBold","data/Lora-SemiBold.ttf")
  
  showtext::showtext_auto()
  
}