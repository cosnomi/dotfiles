"if &shell =~# 'fish$'
"  set shell=sh
"endif

runtime basic-keys.vim
runtime basic-visuals.vim
runtime plugins.vim
runtime lsp-settings.vim

lua require('lsp_settings')
lua require('telescope_settings')
lua require('treesitter')
lua require('misc')
