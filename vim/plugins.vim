" ##########################
" # plugin-related configs #
" ##########################

call plug#begin()
" colorscheme
Plug 'cocopon/iceberg.vim', { 'do': 'cp colors/* ~/.vim/colors/'  }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" visual
Plug 'nathanaelkane/vim-indent-guides' " <Leader>ig to show indent lines
Plug 'itchyny/lightline.vim' " cool status line
Plug 'popkirby/lightline-iceberg'

" parentheses
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

Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'

Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace' " siw to replace the word under the cursor

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tversteeg/registers.nvim', { 'branch': 'main' } " Show register content

" LSP and auto-completion
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

Plug 'norcalli/nvim-colorizer.lua'

" Python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }


call plug#end()

let g:pydocstring_formatter = 'numpy'
" id(insert doc)
nmap <silent> <Leader>id <Plug>(pydocstring)



"##########
" color scheme
"##########
set t_Co=256
let g:tokyonight_transparent = 1
let g:tokyonight_style = "storm"
colorscheme tokyonight
" transparency
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

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
" let g:lightline = {}
" let g:lightline.colorscheme = 'iceberg'
let g:lightline = {'colorscheme': 'tokyonight'}

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
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gs :Git<CR>
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

" snip
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" Disabled due to conflict with vim-operator-replace
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)
"
" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
