set nocompatible
set autoindent

set fileencodings=utf-8
set encoding=utf-8

set ffs=unix,dos,mac

set shiftwidth=4
set softtabstop=4
set expandtab

set confirm
set display=uhex
set whichwrap=b,s,h,l,<,>,[,],~
set nostartofline

set ignorecase
set incsearch
set hlsearch
set wrapscan
set infercase

set showmatch

set backspace=indent,eol,start
set clipboard+=unnamed

set nowritebackup
set noswapfile
set nobackup

set list
set wrap
set number
set textwidth=0
set colorcolumn=120

set novisualbell

if &compatible
    set nocompatible
endif
let s:dein_base = '~/.cache/dein'
let s:dein_src  = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src

if dein#load_state(s:dein_base)
    call dein#begin(s:dein_base)

    let s:toml      = '~/.vim/rc/dein.toml'
    let s:lazy_toml = '~/.vim/rc/deinlazy.toml'

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
colorscheme 1989

nnoremap j gj
nnoremap k gk

let NERDSpaceDelims = 1
nmap <C-T> <Plug>NERDCommenterToggle
vmap <C-T> <Plug>NERDCommenterToggle

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

augroup vimrc
    autocmd!
augroup END

function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
endfunction

autocmd vimrc User plugin-template-loaded call s:template_keywords()
autocmd vimrc User plugin-template-loaded
            \   if search('<+CURSOR+>')
            \ |   silent! execute 'normal! "_da>'
            \ | endif
