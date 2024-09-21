vim.bo.commentstring = "/*%s*/"
vim.bo.formatoptions = vim.bo.formatoptions
  :gsub("t", "")
  :gsub("o", "")
  .. "croql"