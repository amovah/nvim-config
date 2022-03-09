" leader
let g:mapleader = ","

" basics
filetype plugin indent on
filetype plugin on
syntax on

" termguicolors
set termguicolors

set encoding=UTF-8

set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set nowrap                                                                      "Disable word wrap by default
set linebreak                                                                   "Wrap lines at convenient points
set lazyredraw                                                                  "Do not redraw on registers and macros
set hidden                                                                      "Hide buffers in background
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set inccommand=nosplit                                                          "Show substitute changes immidiately in separate split
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --smart-case\ --vimgrep                                         "Use ripgrep for grepping
set tagcase=smart                                                               "Use smarcase for tags
set updatetime=300                                                              "Cursor hold timeout
set shortmess+=c                                                                "Disable completion menu messages in command line
set undofile                                                                    "Keep undo history across sessions, by storing in file
set noswapfile                                                                  "Disable creating swap file
set nobackup                                                                    "Disable saving backup file
set nowritebackup                                                               "Disable writing backup file
set fillchars+=vert:│                                                           "Use vertical line for vertical split
set breakindent                                                                 "Preserve indent on line wrap
set smartindent                                                                 "Use smarter indenting
set autoindent
set nofoldenable                                                                "Disable folding by default
set foldmethod=syntax                                                           "When folding enabled, use syntax method
set diffopt+=vertical                                                           "Always use vertical layout for diffs
set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
set pyxversion=3                                                                "Always use python 3

set clipboard+=unnamedplus " copy to system clipboard
