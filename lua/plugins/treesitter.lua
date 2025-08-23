return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	-- config = function()
	-- 	pcall(function()
	-- 		dofile(vim.g.base46_cache .. "syntax")
	-- 		dofile(vim.g.base46_cache .. "treesitter")
	-- 	end)
	-- end,
	opts = {
		ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "cpp", "c", "python" },
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
}
