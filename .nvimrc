set nocompatible
filetype off

" Leader key
let mapleader = ","

set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'venantius/vim-eastwood'
Plugin 'morhetz/gruvbox'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'bhurlow/vim-parinfer'
Plugin 'rosenfeld/conque-term'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin on

set hidden

nnoremap ' `
nnoremap ` '

set title

set history=1000
" Gruvbox
set background=dark
" let g:gruvbox_italic = 1
colorscheme gruvbox

filetype plugin indent on
runtime macros/matchit.vim

" Get out of insert mode with jj 
inoremap jj <Esc>

syntax enable 
syntax on
" set t_co=256
set termguicolors

" Fast Saving
nmap <leader>w :w!<cr>

" Fast Save+Quit
nmap <leader>x :wq<cr>

set scrolloff=3


let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>
nmap <c-p> :Files<cr>
" Ctrl-P
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set ruler

" Line Numbers
set number

" Rainbow brackets/parens
let g:rainbow_active = 1

" 7 lines to the cursor when moving vertically using j/k
" set so=7

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set magic

set showmatch
set mat=2

vmap <Tab> >gv
vmap <S-Tab> <gv

set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
" set cursorline
set hls is

" clear search highlight
" nnoremap <silent> <C-l><C-l> :nohl<CR><C-l>
nnoremap <silent> <Leader>l :nohl<CR>

" Quick timeouts on key combinations.
set timeoutlen=300

set shortmess=atI

set incsearch
set ignorecase " Ignore case when searching...
set smartcase  " Except when starting with a capital

" NerdTree
map <F2> :NERDTreeToggle<CR>

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Save 1 keystroke on vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow mac copy/paste
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR>

" Double leader key for toggling visual-line mode
nmap <silent> <Leader><Leader> V
vmap <Leader><Leader> <Esc>

" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Disable arrow movement, resize splits instead.

let g:elite_mode = 1
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"  
" Autoset slang -> slim syntax highlighting
au BufRead,BufNewFile *.slang set filetype=slim

" Autoset ecr -> erb syntax highlighting
au BufRead,BufNewFile *.ecr set filetype=erb

" Session stuff
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

" tagbar
nnoremap <silent> <c-b> :TagbarToggle<CR>

" Clojure
" au Filetype clojure nmap <c-c><c-k> :Require<cr>  

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set ssop-=options       " do not store options (vimrc) in a session
"" Make and load method to save session per dir
function! MakeSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction
function! LoadSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif

endfunction

" Auto-commands 
augroup autosourcing
    if(argc() == 0)
        "au VimEnter * nested :call LoadSession() " Uncomment to automatically load session
        au VimLeave * :call MakeSession()
    endif
augroup END
