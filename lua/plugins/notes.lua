return {
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex" },

    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"

      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
        },
      }
    end,

    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",

        callback = function()
          vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", {
            buffer = true,
            desc = "Compile LaTeX",
          })

          vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", {
            buffer = true,
            desc = "View PDF",
          })

          vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<cr>", {
            buffer = true,
            desc = "Stop compilation",
          })

          vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", {
            buffer = true,
            desc = "Clean LaTeX",
          })
        end,
      })
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",

    init = function()
      vim.g.mkdp_filetypes = { "markdown" }

      -- Nie otwieraj preview automatycznie przy wejściu do pliku
      vim.g.mkdp_auto_start = 0

      -- NIE zamykaj preview przy zmianie foo.md -> bar.md
      vim.g.mkdp_auto_close = 0

      -- Aktualizuj preview na żywo podczas edycji
      vim.g.mkdp_refresh_slow = 0

      -- Używaj jednego okna preview dla wszystkich plików Markdown
      vim.g.mkdp_combine_preview = 1
      vim.g.mkdp_combine_preview_auto_refresh = 1

      -- Tylko localhost
      vim.g.mkdp_open_to_the_world = 0

      -- Qutebrowser
      vim.g.mkdp_browser = "qutebrowser"

      -- Pokazuj URL w Neovimie przy uruchomieniu preview
      vim.g.mkdp_echo_preview_url = 1

      -- Ciemny motyw
      vim.g.mkdp_theme = "dark"
    end,

    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",

        callback = function(args)
          vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", {
            buffer = args.buf,
            desc = "Markdown preview",
          })
        end,
      })
    end,
  },
}
