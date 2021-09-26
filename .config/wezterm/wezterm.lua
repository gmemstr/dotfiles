local wezterm = require 'wezterm';

return {
  automatically_reload_config = true,
  font = wezterm.font("IBM Plex Mono"),
  window_close_confirmation = "NeverPrompt",
  font_size = 12,
  initial_cols = 120,
  initial_rows = 35,
  colors = {
      foreground = "#f7f1ff",
      background = "#222222",
      cursor_bg = "#8b888f",
      cursor_fg = "#f7f1ff",
      cursor_border = "#8b888f",
      selection_fg = "#363537",
      selection_bg = "#69676c",
      scrollbar_thumb = "#222222",
      split = "#fce566",
      tab_bar = {
      background = "#222222",
      active_tab = {
        bg_color = "#f7f1ff",
        fg_color = "#69676c",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#69676c",
        fg_color = "#f7f1ff",

      },

      inactive_tab_hover = {
        bg_color = "#69676c",
        fg_color = "#f7f1ff",
        italic = true,
      }
    }
  }
}
