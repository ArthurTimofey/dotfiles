" Vim Configuration File "

call plug#begin()

" COC Autocomplete "
Plug 'neoclide/coc.nvim', {'branch':'release'} 

call plug#end()

" the_silver_searcher "
let g:ackprg = 'ag --nogroup --nocolor --column'

" Disable no next new line
:set nofixendofline

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<S-TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

packloadall

set autoindent

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
" set rtp+=/opt/homebrew/opt/fzf
" let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
" let $FZF_DEFAULT_COMMAND='rg'
" let $FZF_DEFAULT_OPTS='-m --height 50% --border'

" enable highlight search pattern "
set hlsearch

" enable smartcase search sensiticity "
set ignorecase
set smartcase

set tabstop =4
set softtabstop =4
set shiftwidth =4
set textwidth =120
set expandtab
set autoindent
set clipboard=unnamed
set showmatch

" Automatically reload buffer for vim when editing vimrc
autocmd BufWritePost .vimrc,_vimrc source $MYVIMRC
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Keybinds "
" ctrl s to save
nnoremap <c-s> :w<CR> 
inoremap <c-s> <Esc>:w<CR>l 
vnoremap <c-s> <Esc>:w<CR> 

" ctrl p to open file search
nnoremap <c-p> :FZF<CR>

" ctrl f to open search in files
nnoremap <c-f> :Ag<CR>

" going into normal mode while being inside a terminal inside a tab inside vim xD
nnoremap <c-2> <c-w><s-n>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd BufEnter * syntax sync fromstart