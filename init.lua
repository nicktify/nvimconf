
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('lua/myPacker')
require('lua/options')
-- require('lua/lsp')
-- require('lua/git')
-- require('lua/_lualine')
-- require('lua/myTelescope')
-- require('lua/myBufferline')
-- require('lua/formatter')
require('lua/configuration')


require('Comment').setup()
require('go').setup()
require('mason').setup()

