set title "display the file name in the title bar
set number "line number
set ambiwidth=double "display ambiguous width characters
set list "display space character
set noundofile "no.unfile
set nobackup "no~file
set hlsearch "add highligut /search
set shellslash "Path delimiter setting, use'/'insted of \
set ignorecase "ignore Uppercase and lowercase (set ic)
set history=50 "The number of :command history
set virtualedit=block "It enables cursor motion in no character zone
set nrformats-=octal "ignore octal character
set backspace=indent,eol,start "It enabales back space more wider area
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "memorize cursol position.

"clipboard
if system('grep -q Microsoft /proc/version') == 0
  "WSL
  set clipboard&
  set clipboard^=unnamedplus
else
  "Ubuntu Desktop
  "NOTE: need to install xclip
  set clipboard+=unnamedplus "yunk can used for clipboard. This function is necessary xclip. xclip is able to install with apt.
endif

"color scheme
syntax enable
"colorscheme slate
colorscheme default

"tab
set tabstop=2 "display tab=2space
set expandtab "tab=space
set shiftwidth=2 "indentation operations
set smartindent "auto indent
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"modeline https://qiita.com/koara-local/items/536248334edf288292fc
set modeline
set modelines=2 "number of lines to look for file's modeline settings

"tmp
set hidden "Using vim's functionality to edit multiple files
set whichwrap=b,s,[,],<,> "cursor setting
set wildmenu

"emacs key-binding
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

"vim key map
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap <ESC><ESC> :nohl<CR>
"nnoremap <ESC><ESC><ESC> :colorscheme default<CR>
nnoremap x "_x
nnoremap s "_s


"**********dein**********
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
"syntax enable


"##########plugin setting##########

"vim-airline/vim-airline
let g:airline_theme = 'solarized'

"previm/previm
let g:previm_open_cmd = 'firefox'
let g:previm_enable_realtime = 1

"nathanaelkane/vim-indent-guides
"NOTE: ex commaand IndentGuidesEnable
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
let g:indent_guides_enable_on_vim_startup = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"airblade/vim-gitgutter'
set updatetime=100 "response faster

"tpope/vim-commentary'
"NOTE: comment out when gcc in normal mode
nnoremap <C-/> gcc
