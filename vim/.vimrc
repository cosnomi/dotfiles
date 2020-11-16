syntax enable

" main shortcuts
inoremap <silent> jj <ESC>
let mapleader = "\<Space>"
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
nnoremap <ESC>h :nohl<CR>
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
Plug 'jiangmiao/auto-pairs'
" surround.vim
" vim-indent-guides
" vim-fugitive
" tcommennt
" (snippet)
" Add NERDTree shoutcut
" easymotion
" (zsh)
" (tmux)
call plug#end()

" rainbow bracket
let g:rainbow_active = 1

" autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vim-lsp
nnoremap <silent> <Leader>d :<C-u>LspDefinition<CR>
nnoremap <silent> <Leader>r :<C-u>LspRename<CR>
nnoremap <silent> <Leader>k :<C-u>LspHover<CR>
nnoremap <silent> <Leader>f :<C-u>LspDocumentFormat<CR>
nnoremap <silent> <Leader>en :<C-u>LspNextError<CR>
nnoremap <silent> <Leader>n :<C-u>LspNextError<CR>

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_error = {'text': 'E'}
let g:lsp_signs_warning = {'text': 'W'}
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_textprop_enabled = 1
" TODO: 重ならないと何故か表示されない
highlight LspErrorHighlight term=reverse ctermfg=219 ctermbg=89 guifg=#E6DB74 guibg=#1E0010
highlight LspWarningHighlight term=underline cterm=underline gui=underline
highlight LspInformationHighlight term=underline cterm=underline gui=underline
highlight LspHintHighlight term=underline cterm=underline gui=underline
