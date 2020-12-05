syntax enable

" Basic config
inoremap <silent> jj <ESC>
let mapleader = "\<Space>"

if &shell =~# 'fish$'
  set shell=sh
endif


"##########
" color scheme
"##########
colorscheme molokai
set bg=dark
set t_Co=256
" customize comment and visual for visibility
hi Comment ctermfg=102
hi Visual  ctermbg=236
" transparency
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

"##########
"# Visual #
"##########
" line
set cursorline
set number
set rnu
set number relativenumber
set signcolumn=yes

"##########
" status
"##########
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m"
" これ以降は右寄せ表示
set statusline+=%=
" 現在行数/全行数
set statusline+=[L=%l/%L]
set laststatus=2

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

" don't yank for x
vnoremap x "_x
nnoremap x "_x

" Switch ; and : in normal/visual mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Switch 0 and ^ for convinience
noremap 0 ^
noremap ^ 0

" split screen
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

set nrformats=

nnoremap <Leader>v <C-v>
set pastetoggle=<f5>

" faster CursorHold trigger
set updatetime=500

" "#########
" Plugin #
"#########
call plug#begin()
" language support
Plug 'prabirshrestha/vim-lsp' " LSP
Plug 'mattn/vim-lsp-settings' " configure vim-lsp automatically
Plug 'prabirshrestha/asyncomplete.vim' " autocompletion
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'yami-beta/asyncomplete-omni.vim' " show html or css autocompletion provided by omni
Plug 'prettier/vim-prettier', { 'do': 'npm install'  } " formatting for js, html, json, etc

" visual
Plug 'sheerun/vim-polyglot' " various language syntax
Plug 'nathanaelkane/vim-indent-guides' " show indent lines

" parentheses
Plug 'luochen1990/rainbow' " show matching parentheses
Plug 'jiangmiao/auto-pairs' " insert closing parenthesis automatically
Plug 'tpope/vim-surround' " edit parentheses easily
Plug 'tpope/vim-repeat' " allow repeat plugin commands

Plug 'tomtom/tcomment_vim' " gcc to toggle comment
Plug 'lambdalisue/fern.vim' " file

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" colorscheme
"Plug 'cocopon/iceberg.vim', { 'do': 'cp colors/* ~/.vim/colors/'  }

" (snippet)
" vim-test
call plug#end()

" rainbow bracket
let g:rainbow_active = 1

" indent-guides
" <Leader>ig to toggle plugin
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_guide_size = 1

" asyncomplete
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" fern
nnoremap <silent> <Leader>a :Fern .<CR>
function! s:init_fern() abort
  " Define NERDTree like mappings
endfunction
augroup fern-custom

autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" -------
" vim-lsp
" -------
nnoremap <silent> <Leader>gd :<C-u>LspDefinition<CR>
nnoremap <silent> <Leader>hd :<C-u>LspPeekDefinition<CR>
nnoremap <silent> <Leader>gi :<C-u>LspImplementation<CR>
nnoremap <silent> <Leader>hi :<C-u>LspPeekImplementation<CR>
nmap <Leader>p <Plug>(Prettier)

nnoremap <silent> <Leader>r :<C-u>LspRename<CR>
nnoremap <silent> <Leader>R :<C-u>LspReferences<CR>
nnoremap <silent> <Leader>h :<C-u>LspHover<CR>
nnoremap <silent> <Leader>f :<C-u>LspDocumentFormat<CR>

" e: errors
nnoremap <silent> <Leader>en :<C-u>LspNextError<CR>
nnoremap <silent> <Leader>eN :<C-u>LspPreviousError<CR>
" l: diagnostics
nnoremap <silent> <Leader>ln :<C-u>LspNextDiagnostic<CR>
nnoremap <silent> <Leader>lN :<C-u>LspPreviousDiagnostic<CR>
nnoremap <silent> <Leader>L :<C-u>LspDocumentDiagnostics<CR>

" diagnostics
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_error = {'text': 'E'}
let g:lsp_signs_warning = {'text': 'W'}
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_textprop_enabled = 1

highlight LspErrorHighlight term=reverse ctermfg=219 ctermbg=89 guifg=#E6DB74 guibg=#1E0010
highlight LspWarningHighlight term=underline cterm=underline gui=underline
highlight LspInformationHighlight term=underline cterm=underline gui=underline
highlight LspHintHighlight term=underline cterm=underline gui=underline

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')


" ######################################
" # vim-lsp language-specific settings #
" ######################################
" For configuration reproducibility, I decided to avoid use of vim-lsp-settings.
" Each of the following settings will be applied only when the proper executable exists in the environment.

" python
" pip install python-language-server pylint yapf
if executable('pyls')
  let s:pyls_config = {'pyls': {'plugins': {
      \   'pycodestyle': {'enabled': v:false},
      \   'pydocstyle': {'enabled': v:false},
      \   'pylint': {'enabled': v:true},
      \   'flake8': {'enabled': v:false},
      \   'jedi_definition': {
      \     'follow_imports': v:true,
      \     'follow_builtin_imports': v:true,
      \   },
      \   'yapf': { 'enabled': v:true },
      \   'autopep8': {'enabled': v:false}
      \ }}}
  augroup LspPython
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'allowlist': ['python'],
      \ 'workspace_config': s:pyls_config
      \ })
  augroup END
endif

" typescript
" npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
" Note: tsserver is searched in workspace node_modules followed by global install.
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
if executable('typescript-language-server')
  augroup LspTypescript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
      \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact', 'javascript', 'javascript.jsx', 'javascriptreact'],
      \  })
    autocmd User lsp_setup call lsp#register_server({
        \   'name': 'diagnostic-languageserver',
        \   'cmd': { info -> ['diagnostic-languageserver', '--stdio'] },
        \   'whitelist': ['typescript','typescript.tsx','typescriptreact','javascript','javascript.jsx','javascriptreact',],
        \   'initialization_options': {
        \     'linters': {
        \       'eslint': {
        \         'sourceName': 'eslint',
        \         'command': 'eslint_d',
        \         'args': ['--stdin', '--stdin-filename=%filename', '--no-color'],
        \         'rootPatterns': ['.eslintrc', '.eslintrc.js', '.eslintrc.json'],
        \         'formatLines': 1,
        \         'formatPattern': [
        \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
        \           {
        \             'line': 1,
        \             'column': 2,
        \             'message': [4, ' [', 5, ']' ],
        \             'security': 3
        \           }
        \         ],
        \         'securities': {
        \            'error': 'error',
        \            'warning': 'warning'
        \         },
        \       },
        \     },
        \     'filetypes': {'javascript': 'eslint', 'javascript.tsx': 'eslint','javascriptreact': 'eslint','typescript': 'eslint','typescript.tsx': 'eslint','typescriptreact': 'eslint',},
        \   }
        \ })
  augroup END
endif

" VimScript
" npm install -g vim-language-server
if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'vim-language-server',
      \ 'cmd': {server_info->['vim-language-server', '--stdio']},
      \ 'whitelist': ['vim'],
      \ 'initialization_options': {
      \   'vimruntime': $VIMRUNTIME,
      \   'runtimepath': &rtp,
      \ }})
  augroup END
endif

" YAML
" npm install -g yaml-language-server
if executable('yaml-language-server')
  augroup LspYaml
   autocmd!
   autocmd User lsp_setup call lsp#register_server({
       \ 'name': 'yaml-language-server',
       \ 'cmd': {server_info->['yaml-language-server', '--stdio']},
       \ 'whitelist': ['yaml', 'yaml.ansible'],
       \ 'workspace_config': {
       \   'yaml': {
       \     'validate': v:true,
       \     'hover': v:true,
       \     'completion': v:true,
       \     'customTags': [],
       \     'schemas': {},
       \     'schemaStore': { 'enable': v:true },
       \   }
       \ }
       \})
  augroup END
endif

" Rust
" rustup update
" rustup component add rls rust-analysis rust-src
if executable('rls')
  augroup LspRust
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
  augroup END
endif

" Json
" npm install -g json-languageserver
if executable('vscode-json-languageserver')
  augroup LspJson
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'vscode-json-languageserver',
        \ 'cmd': {server_info->['vscode-json-languageserver', '--stdio']},
        \ 'initialization_options': {'provideFormatter': v:true},
        \ 'workspace_config': {
        \   'json': {'format': {'enable': v:true}},
        \ },
        \ 'whitelist': ['json', 'jsonc'],
        \ })
  augroup END
endif

" HTML
" npm install -g html-languageserver
if executable('html-languageserver')
  augroup LspHtml
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'html-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
      \ 'whitelist': ['html'],
    \ })
  augroup END
endif

" CSS (and scss)
" npm install -g vscode-css-languageserver-bin
"if executable('css-languageserver')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'css-languageserver',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
"        \ 'whitelist': ['css', 'less', 'sass'],
"        \ })
"endif

"augroup AsyncOmni
"  autocmd!
"  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"    \ 'name': 'omni',
"    \ 'allowlist': ['*'],
"    \ 'blocklist': ['c', 'cpp'],
"    \ 'completor': function('asyncomplete#sources#omni#completor'),
"    \ 'config': {
"    \   'show_source_kind': 1
"    \ }
"  \ }))
"augroup END
