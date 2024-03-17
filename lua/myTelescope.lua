-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    sorting_strategy = "descending",
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
