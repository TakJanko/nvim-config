local M = {}

function M.create(filename)
  if not filename or filename == "" then
    vim.notify("Podaj nazwę pliku, np. :TexNew analiza.tex", vim.log.levels.ERROR)
    return
  end

  if not filename:match("%.tex$") then
    filename = filename .. ".tex"
  end

  local path = vim.fn.expand("%:p:h") .. "/" .. filename

  if vim.fn.filereadable(path) == 1 then
    vim.notify("Plik już istnieje: " .. path, vim.log.levels.ERROR)
    return
  end

  local title = filename:gsub("%.tex$", ""):gsub("_", " ")

  local content = {
		"\\documentclass[a4paper,11pt]{article}",
		"",
		"% Kodowanie i język",
		"\\usepackage[T1]{fontenc}",
		"\\usepackage[utf8]{inputenc}",
		"\\usepackage[polish]{babel}",
		"",
		"% Matematyka",
		"\\usepackage{amsmath}",
		"\\usepackage{amssymb}",
		"\\usepackage{mathtools}",
		"",
		"\\title{\\textbf{" .. title .. "}}",
		"\\author{Jan Kozubal}",
		"\\date{\\today}",
		"",
		"% Aliasy",
		"\\newcommand{\\definicja}{\\noindent\\textbf{Def:}\\ }",
		"\\newcommand{\\fakt}{\\noindent\\textbf{Fakt:}\\ }",
		"\\newcommand{\\przyklad}{\\noindent\\textbf{Przykład:}\\ }",
		"",
		"\\begin{document}",
		"",
		"\\maketitle",
		"",
		"\\section{foo}",
		"",
		"\\subsection{bar}",
		"",
		"",
		"\\end{document}",
  }

  vim.fn.writefile(content, path)
  vim.cmd("edit " .. vim.fn.fnameescape(path))

  vim.notify("Utworzono: " .. filename, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("TexNew", function(opts)
  M.create(opts.args)
end, {
  nargs = 1,
  complete = "file",
})

return M
