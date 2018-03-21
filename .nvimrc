" Load vim-plug if it's not found
if empty(glob("~/.vim/autoload/plug.vim"))
	execute 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'bhurlow/vim-parinfer'
Plug 'c-brenn/phoenix.vim'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/NrrwRgn'
Plug 'etdev/vim-hexcolor', { 'for': ['vim', 'css', 'html', 'scss']}
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'fisadev/FixedTaskList.vim'
Plug 'gcmt/wildfire.vim'
Plug 'gerw/vim-HiLinkTrace', { 'on': 'HLT!'}
Plug 'godlygeek/tabular'
Plug 'haya14busa/vim-signjk-motion'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'junegunn/fzf.vim'
Plug 'ledger/vim-ledger'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['h', 'cpp'] }
Plug 'rosenfeld/conque-term'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist', { 'for': ['eex', 'ex'] }
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vimlab/split-term.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug '~/Desktop/Sync/_programming/Vim/alpine'

call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

syntax enable
colorscheme gruvbox
"colorscheme alpine

set hidden
set title
set history=1000
set fillchars=vert:\│

" theme / colors
set termguicolors
set background=dark
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
set incsearch

" Quick timeouts on key combinations.
set timeoutlen=300

set shortmess=atIwmfl

set lazyredraw

"shows info or documentation below code, so code doesn't move
set splitbelow 


"""
""" Variables for plugins
"""

" after/syntax concealing
let g:clojure_conceal_extras = 1

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

"" ALE linters
"let g:ale_fixers = {
"\   'clojure' :  ['joker'],
"\   'crystal' :  ['crystal'],
"\   'go'      :  ['gofmt'],
"\   'rust'    :  [],
"\}
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_fix_on_save = 1

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

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

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

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Session stuff
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

" tagbar
nnoremap <silent> <c-b> :TagbarToggle<CR>

" sideways plugin
nnoremap <leader>l :SidewaysLeft<cr>
nnoremap <leader>h :SidewaysRight<cr>

" This selects the next closest text object.
nmap <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)

" Autoset slang -> slim syntax highlighting
au BufRead,BufNewFile *.slang set filetype=slim

" Autoset ecr -> erb syntax highlighting
au BufRead,BufNewFile *.ecr set filetype=erb

" Highlight syntax for word under cursor
nnoremap <leader>pr :HLT!<cr>

nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

xmap S <Plug>(operator-sandwich-add)

tnoremap <Esc> <C-\><C-n>

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

"auto source nvimfile on write
augroup mynvimrc
    au!
    au BufWritePost .nvimrc so $MYVIMRC
augroup END

" FZF :Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --no-ignore --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Edit new file with a new directory
command! -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
