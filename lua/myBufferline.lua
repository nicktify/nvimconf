require("bufferline").setup {
  options = {
    show_buffer_default_icon = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree Explorer",
        text_align = "center",
        separator = true
      }
    },
    separator_style = {"", ""},
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    color_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'none',
    },
  }
}
