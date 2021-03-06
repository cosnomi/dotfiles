" ##########################
" # plugin-related configs #
" ##########################

call plug#begin()
" colorscheme
Plug 'cocopon/iceberg.vim', { 'do': 'cp colors/* ~/.vim/colors/'  }
" language support
Plug 'prabirshrestha/vim-lsp' " LSP
"Plug 'mattn/vim-lsp-settings' " configure vim-lsp automatically
Plug 'prabirshrestha/asyncomplete.vim' " autocompletion
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'yami-beta/asyncomplete-omni.vim' " show html or css autocompletion provided by omni
Plug 'prettier/vim-prettier', { 'do': 'npm install'  } " formatting for js, html, json, etc

" visual
Plug 'sheerun/vim-polyglot' " various language syntax
Plug 'nathanaelkane/vim-indent-guides' " show indent lines
Plug 'itchyny/lightline.vim' " cool status line
Plug 'popkirby/lightline-iceberg'

" parentheses
Plug 'luochen1990/rainbow' " show matching parentheses
"Plug 'jiangmiao/auto-pairs' " insert closing parenthesis automatically
Plug 'tpope/vim-surround' " edit parentheses easily
Plug 'tpope/vim-repeat' " allow repeat plugin commands

Plug 'tomtom/tcomment_vim' " gcc to toggle comment
Plug 'lambdalisue/fern.vim' " file
Plug 'LumaKernel/fern-mapping-fzf.vim' " ff for fzf search
Plug 'lambdalisue/fern-hijack.vim' " hijack netrw

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" smooth scroll
Plug 'yuttie/comfortable-motion.vim'
" extended f
Plug 'rhysd/clever-f.vim'
" project
Plug 'airblade/vim-rooter'
" better *
Plug 'haya14busa/vim-asterisk'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

call plug#end()

"##########
" color scheme
"##########
set t_Co=256
colorscheme iceberg

" rainbow bracket
let g:rainbow_active = 1

" indent-guides
" <Leader>ig to toggle plugin
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=18
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=67
let g:indent_guides_guide_size = 1

" asyncomplete
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <C-n>   pumvisible() ? "\<C-n>" : asyncomplete#force_refresh()
let g:asyncomplete_auto_popup = 1
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" fern
nnoremap <silent> <Leader>a :Fern . -reveal=% <CR>
function! s:init_fern() abort
  nmap <buffer> s <Nop>
endfunction
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" -------
" clever-f
" -------
let g:clever_f_fix_key_direction=1 " Always use f to go forward, F to go backward
let g:clever_f_across_no_line=1 " Only search in the current line
let g:clever_f_smart_case=1 " lower case->lower/upper case, upper case->onyl upper case
let g:clever_f_mark_direct=1 " Highlight as soon as you type f
let g:clever_f_timeout_m=3000 " Timeout ms
let g:clever_f_chars_match_any_signs=';'

" vim-asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'iceberg'

" fzf
nnoremap <Leader>zf :Files<CR>
nnoremap <Leader>zg :Ag<CR>
nnoremap <Leader>zm :Marks<CR>
nnoremap <Leader>zp :Snippets<CR>

" vim-fugitive (git)
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gm :Gmerge<CR>
nnoremap <Leader>gh :0Gllog<CR>

" Unmap s so as not to interfere with window keymap
" See: https://github.com/tpope/vim-fugitive/issues/761
let g:nremap = {"s": "q"}


" gitgutter
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hj <Plug>(GitGutterNextHunk)
nmap ]h <Plug>(GitGutterNextHunk)

nmap <Leader>hN <Plug>(GitGutterPrevHunk)
nmap <Leader>hk <Plug>(GitGutterPrevHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hU <Plug>(GitGutterUnstageHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

" -------
" vim-lsp
" -------
nnoremap <silent> <Leader>jd :LspDefinition<CR>
nnoremap <silent> <Leader>hd :LspPeekDefinition<CR>
nnoremap <silent> <Leader>ji :LspImplementation<CR>
nnoremap <silent> <Leader>hi :LspPeekImplementation<CR>
nmap <Leader>p <Plug>(Prettier)

nnoremap <silent> <Leader>r :LspRename<CR>
nnoremap <silent> <Leader>R :LspReferences<CR>
nnoremap <silent> <Leader>k :LspHover<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>

" e: errors
nnoremap <silent> <Leader>en :LspNextError<CR>
nnoremap <silent> <Leader>eN :LspPreviousError<CR>
" l: diagnostics
nnoremap <silent> <Leader>ln :LspNextDiagnostic<CR>
nnoremap <silent> <Leader>lN :LspPreviousDiagnostic<CR>
nnoremap <silent> <Leader>ll :LspDocumentDiagnostics<CR>

" diagnostics
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_textprop_enabled = 0
let g:lsp_virtual_text_enabled = 1
let g:lsp_highlights_enabled = 0

let g:lsp_signs_error = {'text': 'E>'}
let g:lsp_signs_warning = {'text': 'W>'}

highlight LspErrorText ctermfg=255 ctermbg=89
highlight LspWarningText ctermfg=255 ctermbg=95
highlight LspInformationText ctermfg=250 ctermbg=238
highlight link LspHintText LspInformationText

highlight LspErrorHighlight cterm=underline
highlight LspWarningHighlight cterm=underline
highlight LspInformationHighlight cterm=NONE
highlight LspHintHighlight cterm=NONE

let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('~/vim-lsp.log')
