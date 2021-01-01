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
    \   'flake8': {'enabled': v:false},
    \   'pyflakes': {'enabled': v:false},
    \   'pylint': {'enabled': v:true},
    \   'yapf': {'enabled': v:true },
    \   'jedi_definition': {
    \     'follow_imports': v:true,
    \     'follow_builtin_imports': v:true,
    \   },
    \ }}} 

  augroup LspPython
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->'pyls'},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.git'))},
      \ 'allowlist': ['python'],
      \ 'workspace_config': s:pyls_config,
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

" vls
if executable('vls')
  augroup LspVue
    let g:vim_lsp_settings_vls_config = {
    \   'vetur': {
    \     'useWorkspaceDependencies': v:false,
    \     'validation': {
    \       'template': v:true,
    \       'style': v:true,
    \       'script': v:true
    \     },
    \     'completion': {
    \       'autoImport': v:true,
    \       'useScaffoldSnippets': v:true,
    \       'tagCasing': 'kebab'
    \     },
    \     'format': {
    \       'enable': v:true,
    \       'options': {},
    \       'defaultFormatter': {
    \         'js': '',
    \         'ts': ''
    \       },
    \       'defaultFormatterOptions': {},
    \       'scriptInitialIndent': v:false,
    \       'styleInitialIndent': v:false
    \     },
    \     'dev': {
    \       'logLevel': 'DEBUG'
    \     }
    \   },
    \   'css': {},
    \   'html': {
    \     'suggest': {}
    \   },
    \   'javascript': {
    \     'format': {}
    \   },
    \   'typescript': {
    \     'format': {}
    \   },
    \   'emmet': {},
    \   'stylusSupremacy': {}
    \ }

    au!
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'vls',
    \ 'cmd': {server_info->['vls']},
    \ 'root_uri':{server_info->FindRootDirectory()},
    \ 'initialization_options': {'config': g:vim_lsp_settings_vls_config },
    \ 'allowlist': ['vue'],
    \ 'workspace_config': g:vim_lsp_settings_vls_config,
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
