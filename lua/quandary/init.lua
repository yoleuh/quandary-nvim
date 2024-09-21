local M = {}

-- Define Quandary keywords
local keywords = {
    'if', 'else', 'while', 'return', 'mutable', 'free', 'print', 'nil'
}

-- Define Quandary types
local types = {
    'int', 'Q', 'Ref', 'NonNilRef', 'List', 'NonEmptyList'
}

-- Define Quandary operators
local operators = {
    '+', '-', '*', '=', '==', '!=', '<', '>', '<=', '>=', '&&', '||', '!'
}

local function create_syntax_match(group_name, words)
    vim.cmd('syntax keyword ' .. group_name .. ' ' .. table.concat(words, ' '))
end

function M.setup()
    -- Clear existing syntax rules
    vim.cmd('syntax clear')

    -- Set up syntax highlighting
    create_syntax_match('quandaryKeyword', keywords)
    create_syntax_match('quandaryType', types)
    create_syntax_match('quandaryOperator', operators)

    -- Numbers
    vim.cmd('syntax match quandaryNumber "\\<\\d\\+\\>"')

    -- Strings (assuming Quandary uses double quotes for strings)
    vim.cmd('syntax region quandaryString start=/"/ end=/"/')

    -- Comments
    vim.cmd('syntax region quandaryComment start="/\\*" end="\\*/"')

    -- Function definitions
    vim.cmd('syntax match quandaryFunction "\\<\\w\\+\\s*(" contains=quandaryType')

    -- Set highlight groups
    vim.api.nvim_set_hl(0, 'quandaryKeyword', { link = 'Keyword' })
    vim.api.nvim_set_hl(0, 'quandaryType', { link = 'Type' })
    vim.api.nvim_set_hl(0, 'quandaryOperator', { link = 'Operator' })
    vim.api.nvim_set_hl(0, 'quandaryNumber', { link = 'Number' })
    vim.api.nvim_set_hl(0, 'quandaryString', { link = 'String' })
    vim.api.nvim_set_hl(0, 'quandaryComment', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'quandaryFunction', { link = 'Function' })
end

-- Set up syntax highlighting when a Quandary file is opened
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.q", "*.qet" },
    callback = function()
        vim.bo.filetype = "quandary"
        M.setup()
    end
})

return M