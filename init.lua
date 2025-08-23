require("vim-opts")
-- vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
require("config.lazy")
vim.cmd.colorscheme "catppuccin"
require("mappings")

-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")
