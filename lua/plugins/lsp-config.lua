return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"clangd-format",
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
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("clangd", {
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"marksman",
				"texlab",
			},
			automatic_enable = true,
		},
	},
}
