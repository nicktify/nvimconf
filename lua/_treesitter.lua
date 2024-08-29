-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'lua', 'python', 'rust', 'typescript', 'javascript', 'dart' },
  highlight = { enable = true },
  indent = { enable = true },
}
