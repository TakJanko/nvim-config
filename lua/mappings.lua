local map = vim.keymap.set
-- insert mode
map("i", "<C-h>", "<Left>", { desc = "move left in insert mode" })
map("i", "<C-j>", "<Down>", { desc = "move down in insert mode" })
map("i", "<C-k>", "<Up>", { desc = "move up in insert mode" })
map("i", "<C-l>", "<Right>", { desc = "move right in insert mode" })

-- normal mode
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

-- normal and insert mode
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "save file" })
map({ "n", "i" }, "<C-c>", "<cmd>%y+<CR>", { desc = "copy file" })

-- commenting
map("n", "<leader>/", "gcc", { desc = "comment line", remap = true })
map("v", "<leader>/", "gc", { desc = "comment line", remap = true })

-- numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle numbers" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toogle relative numbers" })

-- nvim-tree
map("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvim-tree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "focus nvim-tree" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map(
	"n",
	"<leader>fz",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ desc = "telescope fuzzy find in current buffer" }
)

-- lsp
local buf = vim.lsp.buf
map("n", "<leader>lh", buf.hover, { desc = "lsp hover" })
map("n", "<leader>li", buf.implementation, { desc = "lsp implementation" })
map("n", "<leader>lc", buf.incoming_calls, { desc = "lsp incoming calls" })
map("n", "<leader>lr", buf.references, { desc = "lsp references" })
map("n", "<leader>lx", buf.clear_references, { desc = "lsp clear references" })
map("n", "<leader>la", buf.code_action, { desc = "lsp code action" })
map("n", "<leader>ldf", buf.definition, { desc = "lsp definition" })
map("n", "<leader>ldc", buf.declaration, { desc = "lsp declaration" })
map("n", "<leader>lf", buf.format, { desc = "lsp format" })

-- termianl
map("t", "<ESC>", "<C-\\><C-N>", { desc = "exit terminal mode" })
map("n", "<leader>tr", "<cmd>terminal<CR>", { desc = "enter new terminal" })

-- trouble
map("n", "<leader>tx", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>tl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- tabufline
map("n","<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Move to next buffer"})
map("n","<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Move to previous buffer"})
map("n","<leader>x", "<cmd>Bdelete<CR>", { desc = "Delete current buffer"})
