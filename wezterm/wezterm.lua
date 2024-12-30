-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "tokyonight_night"

-- Disables auto-reload since home-manager is maintiainig this file
config.automatically_reload_config = false

-- Winddow & Tab config
config.use_fancy_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.macos_window_background_blur = 20
config.window_background_opacity = 0.9

-- Font config
config.font_size = 13.2

-- and finally, return the configuration to wezterm
return config
