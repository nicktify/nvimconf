require("bufferline").setup {
  options = {
    -- show_buffer_default_icon = true,
    get_element_icon = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
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

