-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    sorting_strategy = "descending",
    -- border = false,
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
  },
})

-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

-- local colors = require("rose-pine.palettes").get_palette()
local TelescopeColor = {
	TelescopeMatching = { fg = nil },
	TelescopeSelection = { fg = nil },
	TelescopeNormal = { fg = nil },
	TelescopeBorder = { fg = nil },

	TelescopePromptPrefix = { bg = nil },
	TelescopePromptNormal = { bg = nil },
	TelescopeResultsNormal = { bg = nil },
	TelescopePreviewNormal = { bg = nil },
	TelescopePromptBorder = { bg = nil, fg = nil },
	TelescopeResultsBorder = { bg = nil, fg = nil },
	TelescopePreviewBorder = { bg = nil, fg = nil },
	TelescopePromptTitle = { bg = nil, fg = nil },
	TelescopeResultsTitle = { fg = nil },
	TelescopePreviewTitle = { bg = nil, fg = nil },
}

for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end
