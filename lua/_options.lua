-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

vim.o.cursorline = false
vim.o.scrolloff = 10
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
-- vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme rose-pine]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- Define the auto read function
local function autoread()
  if vim.fn.getbufinfo('%')[1].changed == 1 then
    vim.cmd('echohl WarningMsg | echo "File changed on disk. Buffer not reloaded." | echohl None')
  else
    vim.cmd('checktime')
  end
end

-- Set up autocommands
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  callback = autoread
})

-- Enable autoread globally, this would reload changes on buffers when the change is done outside nvim.
vim.o.autoread = true
