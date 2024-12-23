--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Go to definition open on new tab
vim.keymap.set("n", "gn", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})
vim.keymap.set("n", "gs", "<cmd>vs | lua vim.lsp.buf.definition()<CR>", {})

-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>?', function()
  require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    -- previewer = false,
    layout_config = {
      height = 0.4,
      width = 0.6,
    },
  })
end, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    -- previewer = false,
    layout_config = {
      height = 0.4,
      width = 0.6,
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
    layout_config = {
      height = 0.4,
      width = 0.6,
    },
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- resume function
vim.keymap.set('n', '<leader>re', require('telescope.builtin').resume, { desc = '[S]earch [G]rep' })

vim.keymap.set('n', 'ff', function()
  require('mini.files').open()
end, { desc = '[F]ind [F]iles' })

vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files(require('telescope.themes').get_dropdown {
    previewer = false,
    layout_config = {
      height = 0.4,
      width = 0.6,
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
      width = 0.6,
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

-- configure junp 10 lines up and down
vim.api.nvim_set_keymap('n', 'K', '5k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '5j', { noremap = true, silent = true })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- copy from  https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "<space>p", '"0p')
vim.keymap.set("n", "<space>P", '"0P')
vim.keymap.set("v", "<space>p", '"0p')
vim.keymap.set("n", "<space>c", '"_c')
vim.keymap.set("n", "<space>C", '"_C')
vim.keymap.set("v", "<space>c", '"_c')
vim.keymap.set("v", "<space>C", '"_C')
vim.keymap.set("n", "<space>d", '"_d')
vim.keymap.set("n", "<space>D", '"_D')
vim.keymap.set("v", "<space>d", '"_d')
vim.keymap.set("v", "<space>D", '"_D')

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })
