" ##########################
" # plugin-related configs #
" ##########################

call plug#begin()
" colorscheme
Plug 'cocopon/iceberg.vim', { 'do': 'cp colors/* ~/.vim/colors/'  }

" visual
Plug 'nathanaelkane/vim-indent-guides' " <Leader>ig to show indent lines
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

" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'

Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace' " siw to replace the word under the cursor

Plug 'winston0410/mark-radar.nvim'

Plug 'fisadev/vim-isort'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tversteeg/registers.nvim', { 'branch': 'main' } " Show register content
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'


" Python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

call plug#end()

let g:pydocstring_formatter = 'numpy'
" id(insert doc)
nmap <silent> <Leader>id <Plug>(pydocstring)

nmap <Leader>is ;Isort<CR>


" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

" telescope
nnoremap zf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap zg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap z8 <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap zb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap zc <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap zp <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap zk <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

lua require('lsp_settings')
lua require('telescope_settings')

"##########
" color scheme
"##########
set t_Co=256
colorscheme iceberg
" transparency
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

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
" let g:asyncomplete_auto_popup = 1
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" fern
nnoremap <silent> <Leader>a :Fern . -reveal=% <CR>
" nnoremap <silent> <Leader>q :Fern %p:h<CR>
nnoremap <silent> <Leader>q :Fern %:h -reveal=%<CR>
function! s:init_fern() abort
  " Disable s
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

" vim-operator-replace
map s <Plug>(operator-replace)

" fzf
" nnoremap zf :Files<CR>
" nnoremap zg :Ag<CR>
" nnoremap zm :Marks<CR>
" nnoremap zp :Snippets<CR>
" nnoremap zc :Commits!<CR>
" nnoremap zb :Buffers<CR>
" nnoremap zl :Lines<CR>
" nnoremap zk :BLines<CR>

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

" nvim-lsp
highlight LspDiagnosticsVirtualTextInformation ctermfg=250 ctermbg=238
highlight link LspDiagnosticsVirtualTextHint LspDiagnosticsVirtualTextInformation
highlight LspDiagnosticsVirtualTextWarning ctermfg=255 ctermbg=95
highlight LspDiagnosticsVirtualTextError ctermfg=255 ctermbg=89

" highlight LspErrorHighlight cterm=underline
sign define LspDiagnosticsSignError text=E texthl=LspDiagnosticsVirtualTextError linehl= numhl=
sign define LspDiagnosticsSignWarning text=W texthl=LspDiagnosticsVirtualTextWarning linehl= numhl=
" highlight LspWarningHighlight cterm=underline
"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
