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

require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

vim.opt.termguicolors = true
