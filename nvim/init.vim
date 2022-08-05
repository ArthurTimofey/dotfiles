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

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

filetype plugin indent on
syntax on

set t_Co=256
colorscheme tender
if (has("termguicolors"))
 set termguicolors
endif

" set airline theme
let g:airline_theme = 'tender'

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

" FZF
set rtp+=./config/nvim/pack/junegunn/start/fzf
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'yoffset': 1.0 } }
let g:ackprg = 'ag --nogroup --nocolor --column'

" COC
hi CocErrorSign guibg=#000000
hi CocWarningSign guibg=#000000
hi CocInfoSign guibg=#000000
hi CocHintSign guibg=#000000
hi CocErrorFloat guibg=#000000
hi CocWarningFloat guibg=#000000
hi CocInfoFloat guibg=#000000
hi CocHintFloat guibg=#000000
hi CocSelectedText guibg=#000000
hi CocCodeLens guibg=#000000


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

