"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cFunction        gui=NONE guifg=#B5A1FF


"highlight Functions
syn match cFunction /\<\w\+\%(\s*(\)\@=/

hi default link cFunction Include
"hi cFunction   guifg=#990066   gui=NONE 
"hi default link cFunction cSpecial

"========================================================
" Highlight All Math Operator
"========================================================
 " C math operators
 syn match       cMathOperator     display "[-+/*\%=]"
 " C pointer operators
 syn match       cPointerOperator  display "->\|\."
 " C logical   operators - boolean results
 syn match       cLogicalOperator  display "[!<>]=\="
 syn match       cLogicalOperator  display "=="
 " C bit operators
 syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
 syn match       cBinaryOperator   display "\~"
 syn match       cBinaryOperatorError display "\~="
 " More C logical operators - highlight in preference to binary
 syn match       cLogicalOperator  display "&&\|||"
 syn match       cLogicalOperatorError display "\(&&\|||\)="

 "syn match       cDefineself       display "{\|}"

 " Math Operator
 hi default link cMathOperator            cType
 hi default link cPointerOperator         cType
 hi default link cLogicalOperator         cType
 hi default link cBinaryOperator          cType
 hi default link cBinaryOperatorError     cType
 hi default link cLogicalOperator         cType
 hi default link cLogicalOperatorError    cType

 "hi default link cDefineself              Include
 "hi default link cLogicalOperatorError    guifg=#3EFFE2

 "========================================================
 " My Own DataType
 "========================================================
 syn keyword cType        pthread_t sem_t pthread_mutex_t pthread_cond_t this
