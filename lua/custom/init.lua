local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
vim.g.mapleader = "\\"
vim.opt.colorcolumn = '79'
-- 设置 PowerShell 作为默认的 shell
vim.opt.shell = 'pwsh.exe'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''
