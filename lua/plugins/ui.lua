return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = false,
			integrations = {
				mason = true,
				cmp = true,
				nvimtree = true,
				treesitter = true,
				lsp_trouble = true,
				which_key = true,
				telescope = {
					enable = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "catppuccin-nvim",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "lsp_status" },
				lualine_y = { "filetype" },
				lualine_z = { "progress", "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					separator_style = "slope",
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "NvimTree",
							highlight = "Directory",
							separator = false,
						},
					},
				},
				highlights = require("catppuccin.special.bufferline").get_theme(),
			})
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = {
						"                                           ",
						"     ██╗ █████╗ ███╗   ██╗██╗  ██╗ ██████╗ ",
						"     ██║██╔══██╗████╗  ██║██║ ██╔╝██╔═══██╗",
						"     ██║███████║██╔██╗ ██║█████╔╝ ██║   ██║",
						"██   ██║██╔══██║██║╚██╗██║██╔═██╗ ██║   ██║",
						"╚█████╔╝██║  ██║██║ ╚████║██║  ██╗╚██████╔╝",
						" ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ",
						"                                           ",
						"     ███╗   ██╗██╗   ██╗██╗███╗   ███╗     ",
						"     ████╗  ██║██║   ██║██║████╗ ████║     ",
						"     ██╔██╗ ██║██║   ██║██║██╔████╔██║     ",
						"     ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║     ",
						"     ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║     ",
						"     ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝     ",
						"            Powered By  eovim            ",
						"                                           ",
					},
					packages = { enable = true }, -- show how many plugins neovim loaded
					-- limit how many projects list, action when you press key or enter it will run this action.
					project = {
						enable = true,
						limit = 3,
						label = 'My projects',
						action = "Telescope find_files cwd=",
					},
					mru = {
						enable = true,
						limit = 8,
						label = "Recent files",
						cwd_only = false,
					},
					shortcut = {
						{
							desc = "󰚰 Update",
							group = "@property",
							action = "Lazy update",
							key = "u",
						},
						{
							desc = " Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						-- {
						-- 	desc = " Apps",
						-- 	group = "Special",
						-- 	action = "Telescope app",
						-- 	key = "a",
						-- },
						{
							desc = " Nvim config",
							group = "Number",
							action = "Telescope find_files cwd=~/.config/nvim",
							key = "d",
						},
					},
					footer = {},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
