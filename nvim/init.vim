" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set nopaste
set signcolumn=yes
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4

filetype plugin indent on
syntax on

set t_Co=256
if (has("termguicolors"))
 set termguicolors
endif

autocmd vimenter * ++nested colorscheme gruvbox

" set airline theme
let g:airline_theme = 'gruvbox'

" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

" Automatically reload buffer for vim when editing vimrc
autocmd BufWritePost .vimrc,_vimrc,init.vim source $MYVIMRC

" Copilot
imap <c-space> <Plug>(copilot-next)
inoremap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" FZF
set rtp+=./config/nvim/pack/junegunn/start/fzf
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1.0 } }
let g:ackprg = 'ag --nogroup --nocolor --column'

" COC
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" highlights 
" hi Conceal cterm=italic,underline gui=italic,underline guibg=none guifg=#ffc24b 

" Key bindings
" enable ctrl + s to save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>

let mapleader = ','
nnoremap <leader>a :source $MYVIMRC<CR>
nnoremap <c-p> :Exp<CR>
nnoremap <c-p> :FZF<CR> 
nnoremap <c-g> :Ag<CR>
command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
