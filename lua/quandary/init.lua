local M = {}

function M.setup()
  -- Set up filetype detection
  vim.filetype.add({
    extension = {
      q = "quandary",
      qet = "quandary",
    },
  })

  -- Load syntax file
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.q", "*.qet"},
    callback = function()
      vim.bo.filetype = "quandary"
      vim.cmd [[runtime syntax/quandary.vim]]
    end,
  })
end

return M