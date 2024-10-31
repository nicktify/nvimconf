require('_keymap')
require('_configuration')
require('_packer')
require('_options')
require('_lsp')
require('_git')
require('_lualine')
require('_formatter')
require('_telescope')
require('_treesitter')
require('_bufferline')

require('go').setup()
require('mason').setup()

require('mini.files').setup()
require("oil").setup()

-- comments for .jsx
require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

vim.opt.termguicolors = true

-- like github copilot
-- require("supermaven-nvim").setup({
--   keymaps = {
--     accept_suggestion = "<Tab>",
--     clear_suggestion = "<C-]>",
--     accept_word = "<C-j>",
--   },
--   ignore_filetypes = { cpp = true },
--   color = {
--     suggestion_color = "#ffffff",
--     cterm = 244,
--   },
--   log_level = "info", -- set to "off" to disable logging completely
--   disable_inline_completion = false, -- disables inline completion for use with cmp
--   disable_keymaps = false -- disables built in keymaps for more manual control
-- })
