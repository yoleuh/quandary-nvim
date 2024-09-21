if exists("b:current_syntax")
  finish
endif

" Keywords
syntax keyword quandaryKeyword mutable while if else return print free
highlight link quandaryKeyword Keyword

" Types
syntax keyword quandaryType int Q Ref NonNilRef List NonEmptyList
highlight link quandaryType Type

" Functions
syntax match quandaryFunction "\<\h\w*\>\s*("me=e-1
highlight link quandaryFunction Function

" Numbers
syntax match quandaryNumber "\<\d\+\>"
highlight link quandaryNumber Number

" Operators
syntax match quandaryOperator "[=!<>]=\="
syntax match quandaryOperator "[+\-*]"
syntax match quandaryOperator "&&\|||\|!"
syntax match quandaryOperator "\."
highlight link quandaryOperator Operator

" Comments
syntax region quandaryComment start="/\*" end="\*/"
highlight link quandaryComment Comment

" Strings (assuming Quandary supports string literals)
syntax region quandaryString start='"' end='"'
highlight link quandaryString String

let b:current_syntax = "quandary"