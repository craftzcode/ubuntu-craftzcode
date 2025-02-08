-- Pull in the Wezterm API
local wezterm = require "wezterm"

local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 16

-- Tab
config.enable_tab_bar = false

-- Window Decorations
-- window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Colors
config.colors = {
  foreground = "#F8F8F2",
  background = "#1D1F21",
  cursor_bg = "#FF79C6",
  cursor_border = "#FF79C6",
  cursor_fg = "#1D1F21",
  selection_bg = "#444444",
  selection_fg = "#F8F8F2",
  ansi = { "#FF79C6", "#BD2C40", "#8BC34A", "#F1C40F", "#4FC1E9", "#FB62C6", "#34A85A", "#F8F8F2" },
  brights = { "#FF99B5", "#D75353", "#A7F070", "#FFD866", "#6A9BCB", "#EC6CBC", "#5BC477", "#F8F8F2" },
}

return config
