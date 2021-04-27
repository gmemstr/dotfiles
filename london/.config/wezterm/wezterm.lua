local wezterm = require 'wezterm';

return {
  automatically_reload_config = true,
  font = wezterm.font("IBM Plex Mono"),
  window_close_confirmation = "NeverPrompt",
  font_size = 12,
  initial_cols = 120,
  initial_rows = 35,
  colors = {
      -- The default text color
      foreground = "#f7f1ff",
      -- The default background color
      background = "#222222",

      -- Overrides the cell background color when the current cell is occupied by the
      -- cursor and the cursor style is set to Block
      cursor_bg = "#8b888f",
      -- Overrides the text color when the current cell is occupied by the cursor
      cursor_fg = "#f7f1ff",
      -- Specifies the border color of the cursor when the cursor style is set to Block,
      -- of the color of the vertical or horizontal bar when the cursor style is set to
      -- Bar or Underline.
      cursor_border = "#8b888f",

      -- the foreground color of selected text
      selection_fg = "#363537",
      -- the background color of selected text
      selection_bg = "#69676c",

      -- The color of the scrollbar "thumb"; the portion that represents the current viewport
      scrollbar_thumb = "#222222",

      -- The color of the split lines between panes
      split = "#fce566",

      tab_bar = {

      -- The color of the strip that goes along the top of the window
      background = "#222222",

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = "#f7f1ff",
        -- The color of the text for the tab
        fg_color = "#69676c",

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = "Normal",

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = "None",

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = "#69676c",
        fg_color = "#f7f1ff",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = "#69676c",
        fg_color = "#f7f1ff",
        italic = true,

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      }
    }
  }
}