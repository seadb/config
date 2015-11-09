call pathogen#infect()

"{{{ Windows / ConEmu

"}}}

"{{{ Vim Settings

" map <leader> to ,
let mapleader=","

" Necesary  for lots of cool vim things
set nocompatible

" only edit file 1 time on save 
set nowritebackup

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Who doesn't like autoindent?
set autoindent
set smartindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2 

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
"compiler gcc

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" When I close a tab, remove the buffer
set nohidden

" set paste toggle
set pastetoggle=<F10>

"}}}

"{{{Aesthetics

" Needed for Syntax Highlighting and stuff
filetype on

" Syntax highlighting
syntax on

" Detects which syntax highlighting we should use
filetype plugin indent on


" Set off the other paren
hi MatchParen cterm=underline ctermbg=green ctermfg=blue

" creates a line at character 80
set colorcolumn=80
set ruler
set cursorline
set number

colorscheme busybee

if has("gui_running")
  colorscheme busybee
elseif &t_Co == 256
  colorscheme busybee
endif

set background=dark
"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" status bar
let g:airline#extensions#tabline#enabled = 1
" }}}

"{{{ Buffer Tab Hack

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"}}}

"{{{ Plugin Specific

"{{{ ctrlp


let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|public/|build/)|(\.(swp|ico|git|svn|exe|so|dll|class|png|jpg|jpeg))$'

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"}}}

"{{{ JSX
"}}}

"{{{ Syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
"}}}

"{{{ airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"}}}
"
"}}}

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction
"}}}

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"}}}

"}}}

"{{{ Mappings

" General Mapping Format
"{cmd} {attr} {lhs} {rhs}
"where
"{cmd}  is one of ':map', ':map!', ':nmap', ':vmap', ':imap',
"       ':cmap', ':smap', ':xmap', ':omap', ':lmap', etc.
"{attr} is optional and one or more of the following: <buffer>, <silent>,
"       <expr> <script>, <unique> and <special>.
"       More than one attribute can be specified to a map.
"{lhs}  left hand side, is a sequence of one or more keys that you will use
"       in your new shortcut.
"{rhs}  right hand side, is the sequence of keys that the {lhs} shortcut keys
"       will execute when entered.

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" New Tab - Control t
nnoremap <silent> <C-t> :tabnew<CR>

" DOS is for fools.
nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>

" Toggle paste with <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Collapse (hide text beneath headings) - space bar
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" enter visual block with q in command mode
:nnoremap q <c-v>

" Testing
set completeopt=longest,menuone,preview

iabbrev </ </<C-X><C-O>
iabbrev adn and


"}}}

"{{{ .vimrc

map ,v :sp $VIMRC<CR><C-W>

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


"}}}
