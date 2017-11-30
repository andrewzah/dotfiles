" Load vim-plug if it's not found
if empty(glob("~/.vim/autoload/plug.vim"))
	execute 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/NrrwRgn'
Plug 'fisadev/FixedTaskList.vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/vim-signjk-motion'
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rosenfeld/conque-term'
Plug 'scrooloose/nerdcommenter'
Plug 'soramugi/auto-ctags.vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

syntax enable 
set hidden
set title
set history=1000

" theme / colors
set background=dark
colorscheme gruvbox
set termguicolors

set scrolloff=3

" Cursor position
set ruler

" Line Numbers
set number

" make backspace behave
set backspace=eol,start,indent
set whichwrap+=<,>

set magic

set showmatch
set mat=2

" tab behavior
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab "paste correctly

" searching
set hls "highlight search
set is "incsearch
set ignorecase " Ignore case when searching...
set smartcase  " Except when starting with a capital

" Quick timeouts on key combinations.
set timeoutlen=300

set shortmess=atIwmfl

"""
""" Variables for plugins
"""

" Rainbow brackets/parens
let g:rainbow_active = 1

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

" auto-ctags options
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']

let g:wildfire_objects = {
  \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
  \ "html,xml" : ["at", "it"],
\ }
"for appending types to * rather than excluding: https://github.com/gcmt/wildfire.vim

"stellar var name
let g:mkdp_path_to_chrome = "open -F -n -a Google\\ Chrome"

"""
""" Key remapping
"""

" Leader key
let mapleader = ","

" signjk 
nmap <Leader>j <Plug>(signjk-j)
nmap <Leader>k <Plug>(signjk-k)

" ease of access
nnoremap ' `
nnoremap ` '

" Get out of insert mode with jj 
inoremap jj <Esc>

" Fast Saving
nmap <leader>w :w!<cr>

" Fast Save+Quit
nmap <leader>x :wq<cr>

" fast fuzzy searching
nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>
nmap <c-p> :Files<cr>

" push window up/down
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" clear search highlight
nnoremap <silent> <C-l><C-l> :nohl<CR><C-l>

vmap <Tab> >gv
vmap <S-Tab> <gv

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
nmap <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Session stuff
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

" tagbar
nnoremap <silent> <c-b> :TagbarToggle<CR>

" sideways plugin
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" This selects the next closest text object.
nmap <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)

" Autoset slang -> slim syntax highlighting
au BufRead,BufNewFile *.slang set filetype=slim

" Autoset ecr -> erb syntax highlighting
au BufRead,BufNewFile *.ecr set filetype=erb


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

" FZF :Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
