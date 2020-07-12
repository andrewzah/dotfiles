if has('unix')
  set rtp+=/usr/bin/fzf
elseif has('macunix')
  set rtp+=/usr/local/opt/fzf
end

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Plug 'dahu/vim-asciidoc', { 'for': 'asciidoc' }
Plug 'morhetz/gruvbox'

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

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%

if exists('+clipboard')
  set clipboard=unnamedplus  " Yanks go to the ctrl-c '+' clipboard register
endif

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

" Disable arrow movement, resize splits instead.
let g:elite_mode = 1
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

let g:indentLine_char = '|'


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

set nobackup
set noswapfile
set noundofile

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

""" Syntaxes """
"au! BufRead,BufNewFile *.adoc set syntax=asciidoctor
au! BufNewFile,BufRead *.adoc setfiletype asciidoc


" Automatically make the dir if it doesn't exist on the machine.
silent !mkdir -p ~/.nvim/tmp >/dev/null 2>&1
silent !mkdir -p ~/.nvim/backup >/dev/null 2>&1

" Autoread on common events
autocmd! FocusGained,BufEnter * checktime

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
"if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
"endif
autocmd filetype crontab setlocal nobackup nowritebackup

" FZF :Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!node_modules/" --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

