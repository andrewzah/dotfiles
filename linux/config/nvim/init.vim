if has('unix')
  set rtp+=/usr/bin/fzf
elseif has('macunix')
  set rtp+=/usr/local/opt/fzf
end

call plug#begin('~/.vim/plugged')

""" Language/Syntax
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'NoahTheDuke/vim-just', { 'for': 'just' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'elorest/vim-slang', { 'for': 'slang' }
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'isobit/vim-caddyfile', { 'for': 'caddyfile' }
Plug 'itspriddle/vim-shellcheck', { 'for': 'sh' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'summivox/vim-pawn', { 'for': 'spice' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }

""" Vim Behavior/Functionality
Plug 'bhurlow/vim-parinfer', {'for': 'clojure' }
Plug 'nathanaelkane/vim-indent-guides', { 'for': ['yaml', 'python', 'haml', 'slim', 'slang'] }
Plug 'Alok/notational-fzf-vim', {'on': 'NV'}
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/VisIncr'

""" theme
Plug 'morhetz/gruvbox'

" used for testing/debug
"Plug 'gerw/vim-HiLinkTrace'

call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

syntax enable
set hidden
set title
set history=1000

" theme / colors
set background=dark
"colorscheme hybrid
colorscheme gruvbox
set termguicolors

set scrolloff=3

" Cursor position
set ruler
set rulerformat=%27(%{strftime('%a\ %e,\ %H:%M')}\ %5l,%-1(%c%V%)\ %P%)
set colorcolumn=95

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%

" if exists('+clipboard')
"   set clipboard=unnamedplus  " Yanks go to the ctrl-c '+' clipboard register
" endif

" Line Numbers
set number

" make backspace behave
set backspace=eol,start,indent
set whichwrap+=<,>

set magic

set showmatch
set mat=2

" tab behavior
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smartindent
set smarttab 
set softtabstop=2
set tabstop=8

" searching
set hls "highlight search
set is "incsearch
set ignorecase " Ignore case when searching...
set smartcase  " Except when starting with a capital

set showmatch  " When a bracket is inserted, jump to the matching bracket.
set mat=5      " How long to jump to the matching bracket in tenths of a second.
set list       " Enable 'list mode', which visually displays certain characters
               " upon listchars rules.

" Quick timeouts on key combinations.
set timeoutlen=300

set shortmess=atIwmfl

" Backup, Swap, and Undo
set directory^=~/.nvim/tmp,/tmp
set backupdir=~/.nvim/backup,/tmp
set undodir=~/.nvim/undo,/tmp

" Remove swapfiles, autoread changes instead
set noswapfile
set autoread

set showcmd " display incomplete commands in laststatus.
            " For example, typing the start of a multi-key binding will
            " show each successive key typed in the lower right. Useful
            " for identifying when you're starting a command.

set hidden  " When you 'abandon' a buffer (i.e., when you no longer have a
            " buffer displayed), simply hide it rather than unloading it.
            " Without this, hiding a modified buffer would error due to that
            " buffer not being saved.

"""
""" Variables for plugins
"""

" Conceal
let g:clojure_conceal_extras = 1

" Rainbow brackets/parens
let g:rainbow_active = 1

"let g:fzf_tags_command = 'ctags --extra=+f -R .git/tags'

" gruvbox coloring for fzf
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

" notational fzf vim
let g:nv_search_paths = [ '~/sync/general/thoughts' ]
let g:nv_keymap = {
  \ 'alt-s': 'split ',
  \ 'alt-v': 'vertical split ',
  \ 'alt-t': 'tabedit ',
  \ }

" Disable arrow movement, resize splits instead.
let g:elite_mode = 1
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" auto-ctags options
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']

let g:wildfire_objects = {
  \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
  \ "html,xml" : ["at", "it"],
\ }
"for appending types to * rather than excluding: https://github.com/gcmt/wildfire.vim

let g:indentLine_char = '|'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'go': ['go fmt'],
\ }

let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']

let test#strategy = "dispatch"

let g:go_version_warning = 0

"""
""" Key remapping
"""

" Leader key
let mapleader = ","

" ease of access
nnoremap ' `
nnoremap ` '

" Get out of insert mode with jj 
inoremap jj <Esc>

" Fast Saving
nmap <leader>w :w!<cr>

" Fast Save+Quit
nmap <leader>x :wq<cr>

" Fast quitting
nmap <leader>q :q!<cr>

" fast fuzzy searching
nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>
nmap <c-p> :Files<cr>

" notational velocity
nnoremap <Leader>e :NV<CR>

" push window up/down
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" cut without yanking
nnoremap <leader>d "_d
xnoremap <leader>d "_d
vnoremap <leader>d "_d

" clear search highlight
nnoremap <Leader>nh :nohl<CR><C-l>

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Save 1 keystroke on vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow copy/paste
nnoremap <C-x> "+p
vnoremap <C-c> "+y

" Double leader key for toggling visual-line mode
nnoremap <silent> <Leader><Leader> V
vnoremap <Leader><Leader> <Esc>

" When pressing <leader>cd switch to the directory of the open buffer
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Use backspace key for matchit.vim
nnoremap <BS> %
xnoremap <BS> %

" Session stuff
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

" Highlight syntax for word under cursor
nnoremap <leader>pr :HLT!<cr>

" Grepper
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nnoremap gs <Plug>(GrepperOperator)
xnoremap gs <Plug>(GrepperOperator)

""" Syntaxes """

" Autoset slang syntax highlighting
au BufRead,BufNewFile *.slang set filetype=slang

" Autoset ecr -> erb syntax highlighting
au BufRead,BufNewFile *.ecr set filetype=erb

" sourcepawn
au FileType sourcepawn setlocal makeprg=/home/andrew/programming/sourcemod/sourcemod/addons/sourcemod/scripting/spcomp

" Automatically make the dir if it doesn't exist on the machine.
silent !mkdir -p ~/.nvim/tmp >/dev/null 2>&1

" Autoread on common events
autocmd! FocusGained,BufEnter * checktime

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

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") && &ft != 'gitcommit' |
     \   exe "normal! g`\"" |
     \ endif

autocmd filetype crontab setlocal nobackup nowritebackup

" FZF :Find
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!node_modules/" --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif
