-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Formatting python file with autopep8
vim.api.nvim_set_keymap('n', '<leader>fp', [[:%!autopep8 -<CR>]], { noremap = true, silent = true })

-- copilot
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Go to definition open on new tab
vim.keymap.set("n", "gn", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    layout_config = {
      height = 0.9,
      width = 0.5,
    },
  })
end, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    -- previewer = false,
    layout_config = {
      height = 0.4,
      width = 0.6,
    },
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sg', function()
  require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = false,
    -- prompt_prefix = '🔍 ',
    -- prompt_titl = 'Live Grep:',
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
  })
end, { desc = '[F]ind [G]rep' })

vim.keymap.set('n', '<leader>fb', function()
  require('telescope').extensions.file_browser.file_browser(require('telescope.themes').get_dropdown {
      -- winblend = 10,
      -- transparent = true,
      previewer = true,
      layout_config = {
        height = 0.9,
        width = 0.9,
      },
      -- no_ignore = true,
      -- hidden = true,
      -- open current dir
      cwd = vim.fn.expand('%:p:h'),
      -- show folders firts
      grouped = true,
      files = true,
      add_dirs = true,
      -- depth = 2,
      hide_parent_dir = true,
      dir_icon = '',
      dir_icon_hl = 'Directory',
      prompt_path = true,
    }
  )
end, { desc = '[F]ile [B]rowser', noremap = true })

-- Open mini files
vim.keymap.set('n', 'ff', function()
  require('mini.files').open()
end, { desc = '[F]ind [F]iles' })


vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files(require('telescope.themes').get_dropdown {
    previewer = false,
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
    no_ignore = true,
    hidden = true,
    find_command = {
      "rg",
      "-uu",
      "--files",
      "--hidden",
      "-g",
      "!.git/",
      "-g",
      "!node_modules",
      "-g",
      "!tmp/",
      "-g",
      "!build/",
      "-g",
      "!dist/",
    },
  })
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>sw', function()
  require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown {
    previewer = true,
    layout_config = {
      height = 0.4,
      width = 0.9,
    },
    find_command = {
      "rg",
      "-uu",
      "--files",
      "--hidden",
      "-g",
      "!.git/",
      "-g",
      "!node_modules",
      "-g",
      "!tmp/",
      "-g",
      "!build/",
      "-g",
      "!dist/",
    },
  })
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

-- configure junp 10 lines up and down
vim.api.nvim_set_keymap('n', 'K', '5k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '5j', { noremap = true, silent = true })

