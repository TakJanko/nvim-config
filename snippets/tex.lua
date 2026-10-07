local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- \frac{}{}
  s("ff", {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    i(0),
  }),

  -- \sqrt{}
  s("sq", {
    t("\\sqrt{"),
    i(1),
    t("}"),
    i(0),
  }),

  -- \mathbb{}
  s("bb", {
    t("\\mathbb{"),
    i(1, "R"),
    t("}"),
    i(0),
  }),

  -- \mathbf{}
  s("bf", {
    t("\\mathbf{"),
    i(1),
    t("}"),
    i(0),
  }),

  -- \text{}
  s("tt", {
    t("\\text{"),
    i(1),
    t("}"),
    i(0),
  }),

  -- \sum_{i=1}^{n}
  s("sum", {
    t("\\sum_{"),
    i(1, "i=1"),
    t("}^{"),
    i(2, "n"),
    t("} "),
    i(0),
  }),

  -- \int
  s("int", {
    t("\\int_{"),
    i(1, "0"),
    t("}^{"),
    i(2, "1"),
    t("} "),
    i(3),
    t("\\,dx"),
    i(0),
  }),

  -- \lim
  s("lim", {
    t("\\lim_{"),
    i(1, "x \\to 0"),
    t("} "),
    i(2),
    i(0),
  }),

  -- równanie
  s("eq", {
    t({
      "\\begin{equation}",
      "    ",
    }),
    i(1),
    t({
      "",
      "\\end{equation}",
    }),
    i(0),
  }),

  -- align
  s("ali", {
    t({
      "\\begin{align}",
      "    ",
    }),
    i(1),
    t({
      "",
      "\\end{align}",
    }),
    i(0),
  }),

  -- itemize
  s("item", {
    t({
      "\\begin{itemize}",
      "    \\item ",
    }),
    i(1),
    t({
      "",
      "\\end{itemize}",
    }),
    i(0),
  }),

  -- enumerate
  s("enum", {
    t({
      "\\begin{enumerate}",
      "    \\item ",
    }),
    i(1),
    t({
      "",
      "\\end{enumerate}",
    }),
    i(0),
  }),

  -- nawiasy automatycznie dopasowane
  s("lr", {
    t("\\left("),
    i(1),
    t("\\right)"),
    i(0),
  }),

  -- przypadki
  s("cases", {
    t({
      "\\begin{cases}",
      "    ",
    }),
    i(1),
    t({
      "",
      "\\end{cases}",
    }),
    i(0),
  }),
}
