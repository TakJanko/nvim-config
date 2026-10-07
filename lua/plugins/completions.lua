local function in_markdown_math()
  if vim.bo.filetype ~= "markdown" then
    return true
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_lines(0, 0, row, false)

  if #lines == 0 then
    return false
  end

  lines[#lines] = lines[#lines]:sub(1, col)

  local block_math = false
  local inline_math = false

  for _, line in ipairs(lines) do
    local i = 1

    while i <= #line do
      if line:sub(i, i) == "\\" then
        -- pomiń \$, \(...\), itd.
        i = i + 2
      elseif line:sub(i, i + 1) == "$$" then
        block_math = not block_math
        i = i + 2
      elseif line:sub(i, i) == "$" and not block_math then
        inline_math = not inline_math
        i = i + 1
      else
        i = i + 1
      end
    end
  end

  return block_math or inline_math
end

return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },

    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", {
        link = "Comment",
        default = true,
      })

      local cmp = require("cmp")

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        preselect = cmp.PreselectMode.Item,

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      }
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = false,

    config = function()
      local ls = require("luasnip")

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/snippets",
      })
			ls.filetype_extend("markdown", { "tex" })
      local cmp = require("cmp")

      vim.keymap.set("i", "<Tab>", function()
        if cmp.visible() then
          cmp.select_next_item()
        elseif ls.expand_or_jumpable() and in_markdown_math() then
					ls.expand_or_jump()
				else
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
            "n",
            false
          )
        end
      end, { silent = true })

      vim.keymap.set("s", "<Tab>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    end,
  },
}
