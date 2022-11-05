"##########
"# Visual #
"##########
syntax enable
set termguicolors

" line
set cursorline
set number
set rnu
set number relativenumber
set signcolumn=yes

" Allow move to the end of line
set virtualedit=onemore
" Auto completion
set wildmode=list:longest
" invisible chars
set list
set listchars=tab:>-,trail:.

"##########
"# Config #
"##########
" bell
set belloff=all
set visualbell
"
" setting
set fenc=utf-8
set autoread
set showcmd

" search
set hlsearch
nnoremap zh :nohl<CR>
set incsearch
set ignorecase
set smartcase
set wrapscan

" indentation
set expandtab
set smartindent
set softtabstop=2
set shiftwidth=2

set nrformats=

" colorscheme molokai
" customize comment and visual for visibility
" hi Comment ctermfg=102
" hi Visual  ctermbg=236

set diffopt=internal,filler,algorithm:histogram,indent-heuristic
