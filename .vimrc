syntax on

" 设置当文件被改动时自动载入
set autoread

"colorscheme slate

"set cursorline              " 突出显示当前行
"
"set background=dark

set ruler

set showmatch

set showmode

set esckeys

set hlsearch

set wildmenu

set incsearch

set ignorecase

set smartcase

map <C-n> :nohl<cr>

set nocompatible

set backspace=indent,eol,start

set nomodeline

set nu

set autoindent

set cindent

set tabstop=4

set softtabstop=4

set shiftwidth=4

set helplang=cn

set encoding=utf8

set fileencodings=utf8,ucsbom,gb18030,gbk,gb2312,cp936

set termencoding=utf8

set expandtab

set statusline=%F%m%r%h%w\ [%{&ff}]\[TYPE=%Y]\[POS=%l,%v][%p%%]

set laststatus=2

set mouse=a

"set selection=inclusive

set selection=exclusive
set selectmode=mouse,key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

set smartindent

set whichwrap+=<,>,h,l

set scrolloff=1

filetype plugin indent on

setlocal noswapfile

set confirm

set clipboard=unamed

set pastetoggle=<F7>

set formatoptions=tcrqn

highlight StatusLine ctermfg=green ctermbg=white guibg=white
highlight StatusLineNC ctermfg=7 guibg=white

"模仿windows快捷键
vmap <C-c> "yy
vmap <C-x> "yd
nmap <C-v> "yp
vmap <C-v> "yp
imap <C-v> <Esc>"ypi<Right>
nmap <C-a> ggvG$

"CTags设定
let Tlist_Sort_Type = "name"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1

set tags=tags;
set autochdir
set tags+=/usr/include/tags
filetype plugin indent on

set completeopt=longest,menu
"nmap <F6> <Esc>:!ctags --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+iaS --extra=+q -R *<CR>

function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction
nmap <F6> :call UpdateCtags()<CR>

"自动补全窗口颜色设置
hi Pmenu ctermfg=black ctermbg=gray guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff


"winmanager设置
let g:winManagerWindowLayout='NERDTree|TagList,MiniBufExplorer'
let g:winManagerWidth=30
let g:AutoOpenWinManager=0
map <silent> <F8> :WMToggle<cr>
let g:persistentBehaviour=0


"A.vim设置
map <silent> <F12> :A<cr>


"supertab设置
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-P>"


"MiniBufExploer设置
let g:miniBufExplModSelTarget=1
let g:miniBufExplUseSingleClick=1
let g:miniBufExplorerMoreThanOne=0
hi link MBEVisibleChanged Error
hi link MBEVisibleNormal Error
hi MBENormal ctermfg=white
nmap q :qa<cr>
nmap w :w<cr>

"netrw设置
let g:netrw_fastbrowse=0
let g:netrw_special_syntax=1
let g:netrw_winsize=30
let g:netrw_list_hide='.*\.swp$'
let g:netrw_use_noswf=0

"NERDTree设置
let NERDTreeHighlightCursorline=0
let NERDChristmasTree=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\.swp$']


"vbookmark设置
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'
"禁用默认的按键绑定
let g:vbookmark_disableMapping = 1
"使用自定义的书签快捷键
nnoremap <silent> <F9> :VbookmarkToggle<CR>
nnoremap <silent> <F10> : VbookmarkNext<CR>
nnoremap <silent> <C-F10> : VbookmarkPrevious<CR>


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
endif
let g:LookupFile_TagExpr = '"filenametags;"'
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>


" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 
