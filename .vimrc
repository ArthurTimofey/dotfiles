" Vim Configuration File "

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch':'release'}
let g:coc_global_extensions = [
    \ 'coc-tsserver'
    \ ]
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

Plug 'tomasiser/vim-code-dark'

call plug#end()

packloadall

colorscheme codedark 
syntax on
highlight Normal ctermbg=none
highlight LineNr ctermfg=DarkGrey

" enable mouse support "
set mouse=a 

" enable syntax "
syntax on

" enable line numbers "
set number

" Use FZF in VIM "
set rtp+=/opt/homebrew/opt/fzf
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

" enable highlight search pattern "
set hlsearch

" enable smartcase search sensiticity "
set ignorecase
set smartcase

set tabstop =4
set softtabstop =4
set shiftwidth =4
set textwidth =79
set expandtab
set autoindent

set showmatch

" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Keybinds "
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
