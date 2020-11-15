syntax enable

" main shortcuts
inoremap <silent> jj <ESC>
let mapleader = "\<Space>"
"let g:molokai_original = 1
colorscheme molokai
set t_Co=256

" styling
" line
set cursorline
set number
set rnu
set number relativenumber
" status
set laststatus=2
set virtualedit=onemore
set wildmode=list:longest

" bell
set belloff=all
set visualbell

" setting
set fenc=utf-8
set autoread
set showcmd

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" indentation
set expandtab
set smartindent
set softtabstop=4
set shiftwidth=4

" don't yank for x
vnoremap x "_x
nnoremap x "_x

" split screen
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l


" vim-plug
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'luochen1990/rainbow'
Plug 'reireias/vim-cheatsheet'
Plug 'preservim/nerdtree'
call plug#end()

let g:rainbow_active = 1

" autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:lsp_diagnostics_enabled = 1

" vim-lsp
nnoremap <Leader>d :<C-u>LspDefinition<CR>
nnoremap <Leader>r :<C-u>LspRename<CR>
nnoremap <Leader>k :<C-u>LspHover<CR>
