call pathogen#infect()

"{{{ Vim Settings
" Necesary  for lots of cool vim things
set nocompatible

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

" Set off the other paren
highlight MatchParen ctermbg=4

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

"{{{ Plugin Specific

"""NerdTree"""
map <C-n> :NERDTreeToggle<CR>

"""ctrlp"""
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'

"}}}

"{{{ Functions

" Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction


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


" Testing
set completeopt=longest,menuone,preview

iabbrev </ </<C-X><C-O>
iabbrev adn and


"}}}

"{{{ Auto commands

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


"}}}
