" Enable Powerline
if has('python3')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
elseif has('python')
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
endif

"""""""""""""""""""
"" Settings
""

set list
set title
set ruler
set nocompatible                           " Disable vi-compatibility
set noshowmode                             " Never show what mode we're currently editing in
set nowrap                                 " Don't wrap lines
set number                                 " Always show line numbers
set ignorecase                             " Ignore case when searching
set smartcase                              " Ignore case if search pattern is all lowercase,
set visualbell                             " Don't beep
set noerrorbells                           " Don't beep
set autowrite                              " Save on buffer switch
set timeout

set timeoutlen=200
set ttimeoutlen=100
set t_Co=256                               " 256 Colors
set t_ut=                                  " Fix missing background in tmux vim session
set go-=L                                  " Removes left hand scroll bar
set linespace=1
set encoding=utf-8                         " Force UTF-8 encoding
set laststatus=2                           " Display Powerline status bar
set shortmess+=I                           " Disable welcome message
set lcs=tab:··,trail:░,nbsp:%
set tags=tags
set shiftround                             " Use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set mouse=a                                " Enable mouse support
set numberwidth=5
set showtabline=2
set winminwidth=20
set winwidth=80
set scrolloff=5
set pastetoggle=<F11>
set updatetime=250

" Indenting
set tabstop=4
set shiftwidth=4
set expandtab

" Enable automatic plugin loading from ~/.vim/bundle
execute pathogen#infect()

" Enable syntax highlighting
syntax on
set background=dark
colorscheme solarized
hi Normal ctermbg=NONE

" Split window navigation
map <silent> j :tabprevious<cr>
map <silent> k :tabnext<cr>

" NERDTree config

" Toggle NERDTree itself with "N"
map <silent> N :NERDTreeToggle<cr>
" Toggle NERDTree focus with "<backslash>"
map <silent> \ :NERDTreeFocusToggle<cr>

" Hide NERDTree help text
let g:NERDTreeMinimalUI = 1
" Auto open NERDTree
let g:nerdtree_tabs_open_on_console_startup = 0
" Always focus on the file tab by default
let g:nerdtree_tabs_smart_startup_focus = 2

" Make the Powerline very fancy
let g:Powerline_symbols = 'fancy'

" Startify
let g:startify_default_custom_header = [ '                      -`                     ',
                                       \ '                     .o+`                    ',
                                       \ '                    `ooo/                    ',
                                       \ '                   `+oooo:                   ',
                                       \ '                  `+oooooo:                  ',
                                       \ '                  -+oooooo+:                 ',
                                       \ '                `/:-:++oooo+:                ',
                                       \ '               `/++++/+++++++:               ',
                                       \ '              `/++++++++++++++:              ',
                                       \ '             `/+++ooooooooooooo/`            ',
                                       \ '            ./ooosssso++osssssso+`           ',
                                       \ '           .oossssso-````/ossssss+`          ',
                                       \ '          -osssssso.      :ssssssso.         ',
                                       \ '         :osssssss/        osssso+++.        ',
                                       \ '        /ossssssss/        +ssssooo/-        ',
                                       \ '      `/ossssso+/:-        -:/+osssso+-      ',
                                       \ '     `+sso+:-`                 `.-/+oso:     ',
                                       \ '    `++:.                           `-/+/    ',
                                       \ '    .`                                 `/    ',
                                       \ '',
                                       \ '',
                                       \ '' ]

let g:startify_custom_header = g:startify_default_custom_header

let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 1
let g:startify_files_number       = 20

let g:startify_list_order = [ [ '  Sessions' ],
                            \ 'sessions',
                            \ [ '  Bookmarks' ],
                            \ 'bookmarks',
                            \ [ '  MRU' ],
                            \ 'dir' ]

hi StartifyBracket ctermfg=0 cterm=bold
hi StartifyHeader  ctermfg=195

