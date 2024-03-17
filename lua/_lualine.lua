require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
    -- show current opened buffer
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 },
    },
    lualine_x = {
      { 'filetype', colored = true },
    },
    lualine_y = {},
  }
}
