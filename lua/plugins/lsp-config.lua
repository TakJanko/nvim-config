return {
	{
		"mason-org/mason.nvim",
		opts = function()
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
		end,
	},
}
