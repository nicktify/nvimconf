
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    "williamboman/mason.nvim"
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  -- use {
  --   'f-person/git-blame.nvim',
  -- }
  -- use 'tribela/vim-transparent'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  -- Fuzzy Finder (files, lsp, etc)
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
  }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  -- comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'mg979/vim-visual-multi'
  use {
    "windwp/nvim-ts-autotag",
    config = function() require('nvim-ts-autotag').setup() end
  }
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  use {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }

  use("github/copilot.vim")
  use("echasnovski/mini.files")

  use 'mfussenegger/nvim-dap'

  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'mxsdev/nvim-dap-vscode-js'

  -- use 'sebdah/vim-delve'

  -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

vim.o.cursorline = true
vim.o.scrolloff = 3
vim.o.wrap = false
vim.wo.number = true
vim.o.clipboard = 'unnamedplus'

-- Enable mouse mode
vim.o.mouse = 'a'

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- set tab space to stop at 2
-- vim.o.tabstop = 2
-- vim.o.shiftwidth = 2

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- ignore swap file warning
vim.o.swapfile = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = false
vim.o.smartcase = false

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme catppuccin]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Formatting python file with autopep8
vim.api.nvim_set_keymap('n', '<leader>fp', [[:%!autopep8 -<CR>]], { noremap = true, silent = true })

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Go to definition open on new tab
vim.keymap.set("n", "gn", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
vim.g.gitblame_display_virtual_text = 0

-- local git_blame = require('gitblame')
-- git_blame.disable()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
    -- show current opened buffer
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 },
    },
    lualine_x = {
      { 'filetype', colored = true },
    },
    lualine_y = {},
  }
}

-- Enable Comment.nvim
require('Comment').setup()

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

-- [[ Configure Telescope ]]
-- -- this is a test of a recording
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    sorting_strategy = "descending",
    layout_config = {
      height = 0.9,
      -- this is a test of a recording
      width = 0.9,
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- this is a test of a recording
pcall(require('telescope').load_extension, 'live_grep_args')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
    winblend = 10,
    -- this is a test of a recording
    previewer = false,
    layout_config = {
      height = 0.9,
      width = 0.5,
    },
  })
end, { desc = '[ ] Find existing buffers' })
-- this is a test of a recording

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
  -- this is a test of a recording
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sg', function()
  vim.cmd('tabnew')
  require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    -- this is a test of a recording
    prompt_prefix = '🔍 ',
    prompt_titl = 'Live Grep:',
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
    keep_open_on_exit = true,
    -- this is a test of a recording
  })
end, { desc = '[F]ind [G]rep' })

vim.keymap.set('n', '<leader>fb', function()
  require('telescope').extensions.file_browser.file_browser(
    require('telescope.themes').get_dropdown {
      winblend = 10,
      -- this is a test of a recording
      previewer = true,
      layout_config = {
        height = 0.9,
        width = 0.9,
      },
      -- no_ignore = true,
      -- hidden = true,
      -- -- this is a test of a recording
      -- open current dir
      cwd = vim.fn.expand('%:p:h'),
      -- show folders firts
      grouped = true,
      files = true,
      add_dirs = true,
      -- depth = 2,
      -- -- this is a test of a recording
      hide_parent_dir = true,
      dir_icon = '',
      dir_icon_hl = 'Directory',
      prompt_path = true,
    }
  )
end, { desc = '[F]ile [B]rowser', noremap = true })
-- this is a test of a recording

-- Open mini files
vim.keymap.set('n', 'ff', function()
  require('mini.files').open()
end, { desc = '[F]ind [F]iles' })

vim.keymap.set('n', '<leader>sf', function()
  -- this is a test of a recording
  require('telescope.builtin').find_files(require('telescope.themes').get_dropdown {
    previewer = false,
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
    no_ignore = true,
    -- this is a test of a recording
    hidden = true,
    find_command = {
      "rg",
      "-uu",
      "--files",
      "--hidden",
      "-g",
      -- this is a test of a recording
      "!.git/",
      "-g",
      "!node_modules",
      "-g",
      "!tmp/",
      "-g",
      "!build/",
      -- this is a test of a recording
      "-g",
      "!dist/",
    },
    -- find_command = { 'rg', '--files', '--hidden', '--glob', '!.git', '--glob', '!node_modules' },
  })
end, { desc = '[S]earch [F]iles' })

-- this is a test of a recording
vim.keymap.set('n', '<leader>sw', function()
  require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown {
    previewer = true,
    layout_config = {
      height = 0.4,
      width = 0.9,
    },
    -- this is a test of a recording
    find_command = {
      "rg",
      "-uu",
      "--files",
      "--hidden",
      "-g",
      "!.git/",
      -- this is a test of a recording
      "-g",
      "!node_modules",
      "-g",
      "!tmp/",
      "-g",
      "!build/",
      "-g",
      -- this is a test of a recording
      "!dist/",
    },
    -- find_command = { 'rg', '--files', '--hidden', '--glob', '!.git', '--glob', '!node_modules' },
  })
end, { desc = '[S]earch current [W]ord' })

-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- -- this is a test of a recording
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- open nvim-tree
vim.keymap.set('n', '<leader>nt', function()
  require('nvim-tree').toggle()
end, { desc = '[N]vim [T]ree' })

-- [[ Configure Treesitter ]]
-- -- this is a test of a recording

-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'javascript' },
  highlight = { enable = true },
  indent = { enable = true },
}
-- this is a test of a recording

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- this is a test of a recording
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  ---- this is a test of a recording
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    -- this is a test of a recording
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  -- this is a test of a recording
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  -- -- this is a test of a recording
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  -- this is a test of a recording
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      -- this is a test of a recording
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- this is a test of a recording
-- Setup mason so it can manage external tooling

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'gopls' }

-- nvim-cmp supports additional completion capabilities
-- -- this is a test of a recording
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- this is a test of a recording
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
-- this is a test of a recording
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- this is a test of a recording
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- this is a test of a recording
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- this is a test of a recording
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
        -- this is a test of a recording
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
        -- this is a test of a recording
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    -- this is a test of a recording
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- this is a test of a recording
-- nvim tree setup
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- this is a test of a recording

-- empty setup using defaults
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    -- this is a test of a recording
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    -- this is a test of a recording
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$' }
  },
  actions = {
    -- this is a test of a recording
    open_file = {
      quit_on_open = false
    }
  },
  git = {
    enable = true,
    ignore = false,
    -- this is a test of a recording
  }
})

require("bufferline").setup {
  options = {
    show_buffer_default_icon = false,
    offsets = {
      -- this is a test of a recording
      {
        filetype = "NvimTree",
        text = "NvimTree Explorer",
        text_align = "center",
        separator = true
      }
    },
    -- this is a test of a recording
    separator_style = {"", ""},
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    color_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    -- this is a test of a recording
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'none',
    },
  }
}

-- this is a test of a recording

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
  -- this is a test of a recording
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    -- this is a test of a recording
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
    -- this is a test of a recording
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
    -- this is a test of a recording
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
      mocha = {
        base = "#000000",
      -- this is a test of a recording
        mantle = "#000000",
        crust = "#000000",
      },
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
    -- this is a test of a recording
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
      -- this is a test of a recording
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})


vim.g.delve_command = 'dlv'

require('mason').setup()
require('go').setup()
-- this is a test of a recording

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
require('mini.files').setup()

require('dap-go').setup()
require('dap.ext.vscode').load_launchjs(nil, {})

local dap, dapui =require("dap"),require("dapui")
dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

