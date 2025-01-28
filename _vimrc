let mapleader=","
"----
colorscheme ron
set guicursor+=a:blinkon0
set hlsearch | set incsearch
set modeline
set showcmd
set path+=** | set wildmenu
set nrformats=
"" https://stackoverflow.com/questions/1636297/how-to-change-the-folder-path-for-swp-files-in-vim/1636944
" set directory=~/.vim//
" set backupdir=~/.vim//

set nocompatible
filetype plugin indent on
syntax on
" + Change to filetype off when introducing Vundle

" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
"   other than the (hard)tabstop
set softtabstop=4
" no tabs at all - just spaces
set expandtab
set smartindent

nnoremap <leader>co :colors <C-D>

" TODO: Convenience-mappings for 'thorny' characters
" --
nnoremap <leader>o <CR> | inoremap <leader>o <Esc>o | cnoremap <leader>o <CR>
nnoremap <leader><leader>o o<Esc> | nnoremap <leader><leader>u O<Esc><CR>

" Trim next blank
nnoremap <C-D> f x
" Forget-delete v-marked
vnoremap <C-D> "_d
" --
" Copy WORD to "+ **
nnoremap <leader>yy "+yiW
" Copy Whole Buffer to "+ **
nnoremap YY :%y+<CR>
" Scratch whole buffer
nnoremap D+ :%d+
nnoremap DD :%d

" Buffers  __
"%% expanderar till aktiva filens mapp (= %:h) *****
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Copy WORD to "+ **
nnoremap <leader>yy "+yiW
" Copy Whole Buffer to "+ **
nnoremap YY :%y+<CR>
" Scratch whole buffer
nnoremap D+ :%d+
nnoremap DD :%d
" Pop buffer from buffer list
nnoremap <C-S-A-w> :bw<CR>

" ---- Jump in Change-List ----
nnoremap gg g; | nnoremap gG g,
nnoremap <A-PageUp> g; | nnoremap <A-PageDown> g,
" ---- Jump between Marks ----
nnoremap <S-PageUp> [' | nnoremap <S-PageDown> ]'
nnoremap <PageUp> [` | nnoremap <PageDown> ]`
nnoremap <leader>gg gg

" logical undo
nnoremap U <C-R>

" Custom movements  __
" line refocus
noremap tt zt | noremap TT zb
" end/start of line
noremap L $ | noremap H 0
onoremap L $ | onoremap H 0
noremap gL g_ | noremap gH ^
onoremap gL g_ | onoremap gH ^

nnoremap <leader><leader>o o<Esc>
nnoremap <leader><leader>u O<Esc><CR>

" Saving, Escaping ----
" Custom Escape-Mapping  __
noremap <leader>j <Esc> | inoremap <leader>j <Esc> | cnoremap <leader>j <Esc>
noremap <leader>J <Esc> | inoremap <leader>J <Esc> | cnoremap <leader>J <Esc>
" --
" inoremap <leader>ee <Esc>:up<CR>gi<CR>

" Searching  __
" Toggle ignorecase ***
nnoremap <leader>ic :set ic!<CR>
noremap <leader>ii / | noremap <leader>uu ?
nnoremap <leader>iv /\v | nnoremap <leader>uv ?\V
noremap <leader>ic /\c | noremap <leader>uc ?\c
" --
" Star and Hash only hlmarks word. Cont. search with 'n'
" + Reports number of matches
nnoremap * *N:%s///gn<CR>
nnoremap # #N:%s///gn<CR>
" --
" HACK: Change to nzzb / Nzzb
nnoremap n nzzh | nnoremap N Nzz
" --
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" Cutting/Pasting (from two system clipboards)  __
inoremap <leader>ii <C-R>+<CR>

nnoremap <leader>ia "*p
inoremap <leader>ia <C-R>*
" inoremap <leader>ia <C-R><C-R>*

" Macros/Actions  __
" Run latest run macro **
noremap Q @@
" Run latest command/action, jump to next search-match + center
nnoremap ö .nzz
" Run latest macro/cli-command, jump to next search-match + center
nnoremap zö @@nzz
