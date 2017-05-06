set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible
filetyp	off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
"Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"common settting
set nu
scriptencoding utf-8
set fenc=utf-8
set tabstop=4
set shiftwidth=4
set expandtab 
set hlsearch
set nobackup

"NERDTree setting

map <C-n> :NERDTreeToggle<CR>
"close NERDDTree when it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | e

map <C-i> :IndentGuidesToggle<CR>

" syntastic setting
function! EnableSyntastic()
    if !g:my_syntastic_check_open
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_auto_loc_list=1
        let g:syntastic_check_on_open=0

        let g:my_syntastic_check_open = 1
    endif
endfunction

"syntastic-lua-checker setting
function! EnableSyntasticLuacheck()
    "let g:syntastic_lua_checkers = ["luacheck", "luac"]
    let g:syntastic_lua_checkers = ["luacheck"]
    let l:args1="--std _G max lua53 --ranges --codes "
    let l:args2= '' " --no-unused-args
    let g:syntastic_lua_luacheck_args = l:args1.l:args2 
endfunction

let g:my_syntastic_check_open = 0
autocmd Filetype lua :call EnableSyntastic()
autocmd Filetype lua :call EnableSyntasticLuacheck()

"colorscheme settting
syntax enable

"colorscheme solarized
"colorscheme molokai
let g:molokai_original=1
let g:rehas256=1
set bg=light


"CtrlP setting
let g:ctrlp_cmd = 'CtrlPBuffer'

"hightlight column
autocmd FileType lua,python,c,c++,mk,rb set cc=80
map ,ch :call SetColorColumn() <CR>
function! SetColorColumn()
  let col_num = virtcol(".")
  let cc_list = split(&cc, ',')
  if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
  else
    execute "set cc-=".col_num
  endif
endfunction

set sessionoptions-=blank " prevent :mksession from saving "other windowss " as empty quickfix windows.
"mapping
:nmap <F2> :wa<Bar>exe "mksession!" v:this_session<CR>
:nmap ,h :exe "vertical res-10"<CR>
:nmap ,l :exe "vertical res+10"<CR>
:map ,k <C-w>-<C-w>-<C-w>-
:map ,j <C-w>+<C-w>+<C-w>+
:nmap ,tb :exe "Tagbar"<CR>
