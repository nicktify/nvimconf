
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('lua/_packer')
require('lua/_options')
require('lua/_lsp')
require('lua/_git')
require('lua/_lualine')
require('lua/_bufferline')
require('lua/_formatter')
require('lua/_configuration')
require('lua/_keymap')
require('lua/_dap')
require('lua/_telescope')
require('lua/_treesitter')

require('Comment').setup()
require('go').setup()
require('mason').setup()
require('mini.files').setup()

