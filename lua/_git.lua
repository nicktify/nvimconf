
-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    -- delete = { text = '_' },
    delete = { text = "" },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  -- signs = {
  --   add = { text = "▎" },
  --   change = { text = "▎" },
  --   delete = { text = "" },
  --   topdelete = { text = '‾' },
  --   changedelete = { text = "▎" },
  --   untracked = { text = "▎" },
  -- },
}

-- local git_blame = require('gitblame')
-- git_blame.disable()

