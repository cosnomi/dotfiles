" Basic config
inoremap <silent> jj <ESC>
let mapleader = "\<Space>"

" don't yank for x
vnoremap x "_x
nnoremap x "_x

" ; to enter ex command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Insert blank newline with Enter and S-Enter
nnoremap ,<CR> O<Esc>j
nnoremap s<CR> o<Esc>k

" Switch 0 and ^ for convinience
noremap 0 ^
noremap ^ 0

" split screen
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

nnoremap s+ 5<C-w>+
nnoremap s- 5<C-w>-
nnoremap s> 5<C-w>>
nnoremap s< 5<C-w><
nnoremap s= 5<C-w>=

nnoremap ss :sp<CR><C-w>j
nnoremap sv :vs<CR><C-w>l

" quickfix
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

" visual mode
nnoremap <Leader>v <C-v>
set pastetoggle=,p

" faster CursorHold trigger
set updatetime=1000

set hidden

" Disable default
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap s <Nop>

" Escape from Leader prefix
nnoremap <silent> <Leader>jj <Nop>
