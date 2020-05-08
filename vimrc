set background=dark

syntax on

let mapleader=' '

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set expandtab       " tabs are spaces

set number          " show line number
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set backspace=indent,eol,start

filetype indent on  " load filetype-specific indent files

set wildmenu        " visual autocomplete for command menu
" set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]

set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/coverage/**
set wildignore+=**/e2e/**
set wildignore+=**/dist/**

set noswapfile

let g:typescript_indent_disable = 1

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')

" Add Vims native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <C-a> <C-w><C-j>
nnoremap <C-l> <C-w><C-k>
nnoremap <C-e> <C-w><C-l>
nnoremap <C-i> <C-w><C-h>

nnoremap <silent> <leader>e :exe "vertical resize +10"<CR>
nnoremap <silent> <leader>i :exe "vertical resize -10"<CR>

let g:vim_airline_theme = 'nord'

colorscheme nord
