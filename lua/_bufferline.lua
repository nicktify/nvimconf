require("bufferline").setup {
  options = {
    show_buffer_default_icon = true,
    separator_style = {"", ""},
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    color_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    -- indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      -- style = 'none',
    -- },
  }
}
