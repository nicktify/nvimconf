local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

-- set tab for golang, javascript and typescript as 2 spaces
vim.api.nvim_exec([[
augroup TSFmt
  autocmd!
  autocmd FileType typescript,javascript setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
]], false)

-- set tab for python as 4 spaces
vim.api.nvim_exec([[
augroup GoPythonFmt
  autocmd!
  autocmd FileType go,python setlocal tabstop=4 shiftwidth=4 expandtab
augroup END
]], false)
