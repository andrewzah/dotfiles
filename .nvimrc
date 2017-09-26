" Leader key
let mapleader = ","

" Load plugins
execute pathogen#infect()
" Gruvbo
set background=dark
" let g:gruvbox_italic = 1
colorscheme gruvbox

filetype plugin indent on
runtime macros/matchit.vim

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

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" oo/OO insert newline without entering INSERT
" nmap oo o<Esc>k
" nmap OO O<Esc>j

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

" Autoset slang -> slim syntax highlighting
au BufRead,BufNewFile *.slang set filetype=slim

" Autoset ecr -> erb syntax highlighting
au BufRead,BufNewFile *.ecr set filetype=erb

" Session stuff
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

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
