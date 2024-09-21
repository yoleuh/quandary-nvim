local M = {}

function M.setup()
  vim.api.nvim_create_augroup("quandary", { clear = true })
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    group = "quandary",
    pattern = {"*.q", "*.qet"},
    callback = function()
      vim.bo.filetype = "quandary"
    end,
  })
end

return M
