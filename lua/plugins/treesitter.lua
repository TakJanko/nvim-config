return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "cpp",
        "c",
        "python",

        -- Markdown
        "markdown",
        "markdown_inline",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = {
        enable = true,
      },
    },
  },
}
