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
-- if lenguages is python or lua, set tabstop to 4 else 2
-- with
-- vim.o.expandtab = true
-- vim.o.tabstop = 2
-- vim.o.shiftwidth = 2
if vim.bo.filetype == 'python' or vim.bo.filetype == 'lua' then
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
else
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
end

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
vim.cmd [[colorscheme rose-pine]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
