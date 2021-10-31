local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({
    "Dank Mono",
    "SauceCodePro Nerd Font",
  }),
  font_size = 14,
  color_scheme = "ayu",
  line_height = 1.1,
  enable_tab_bar = false,
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 10
  }
}
