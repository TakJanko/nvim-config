local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
opt.tabstop = 2
opt.expandtab = false
opt.softtabstop = 2
opt.shiftwidth = 2
opt.laststatus = 3
opt.number = true
opt.relativenumber = true
opt.shiftround = true
opt.signcolumn = "yes"
opt.smartindent = false
opt.termguicolors = true

local servers = { "lua_ls", "clangd", "pyright" }
vim.lsp.enable(servers)
vim.lsp.completion.enable()

