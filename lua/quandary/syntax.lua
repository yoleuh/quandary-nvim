local function set_syntax()
    local syntax = {
      QuandaryKeyword = { "mutable", "while", "if", "else", "return", "print", "free" },
      QuandaryType = { "int", "Q", "Ref", "NonNilRef", "List", "NonEmptyList" },
      QuandaryOperator = { "==", "!=", "<=", ">=", "<", ">", "+", "-", "*", "&&", "||", "!", "." },
    }
  
    for group, words in pairs(syntax) do
      vim.cmd(string.format("syntax keyword %s %s", group, table.concat(words, " ")))
    end
  
    vim.cmd [[
      syntax match QuandaryFunction "\<\h\w*\>\s*("me=e-1
      syntax match QuandaryNumber "\<\d\+\>"
      syntax region QuandaryComment start="/\*" end="\*/"
      syntax region QuandaryString start='"' end='"'
    ]]
  
    local highlights = {
      QuandaryKeyword = "Keyword",
      QuandaryType = "Type",
      QuandaryFunction = "Function",
      QuandaryNumber = "Number",
      QuandaryOperator = "Operator",
      QuandaryComment = "Comment",
      QuandaryString = "String",
    }
  
    for group, link in pairs(highlights) do
      vim.cmd(string.format("highlight link %s %s", group, link))
    end
  end
  
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "quandary",
    callback = set_syntax,
  })
  