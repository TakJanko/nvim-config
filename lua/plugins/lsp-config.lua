return {
	{
		"mason-org/mason.nvim",
		opts = function()
			-- dofile(vim.g.base46_cache .. "mason")
			return {
				ensure_installed = {
					"stylua",
					"shfmt",
				},
				PATH = "prepend",
				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},
				max_concurrent_installers = 10,
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function()
			require("mason-lspconfig").setup({ automatic_enable = true })
			-- return require("config.mason-lspconfig").setup{}
		end,
	},
}
