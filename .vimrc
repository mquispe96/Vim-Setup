set number
set relativenumber
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set mouse=a
set backspace=indent,eol,start
set splitbelow
set splitright
set hlsearch
set ignorecase
set filetype=pgsql
set title
set noswapfile
syntax on
set cursorline

call plug#begin()

" OverAll Functionality Plugins
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multi Cursor ctrl + n 
Plug 'jiangmiao/auto-pairs' " Auto closes brackets and quotes
Plug 'alvan/vim-closetag' " Auto closes html tags
Plug '907th/vim-auto-save' " Autosaves files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'branch': 'release/0.x',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] } " Prettier Plugin
Plug 'github/copilot.vim' " Copilot Plugin

"Misc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " space_vim_dark Scheme
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons

" NerdTree Plugin and Related
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'airblade/vim-rooter' " Locates Parent Repo
Plug 'Xuyuanp/nerdtree-git-plugin' " Git Status
Plug 'tpope/vim-fugitive' " Git Commands in vim
Plug 'airblade/vim-gitgutter' " Git file status

" Coding Helpers
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'mlaursen/vim-react-snippets' "React snippets
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview

set encoding=UTF-8

call plug#end()

" i - insert mode
" n - normal mode
" v - visual mode

" Run Prettier
" autocmd BufWritePre *.html,*.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

command! -nargs=0 PP :PrettierAsync

let g:auto_save = 1  " enable AutoSave on Vim startup

" Set cursor shape in different modes
let &t_SI = "\e[5 q"  " Insert mode
let &t_SR = "\e[5 q"  " Replace mode
let &t_EI = "\e[5 q"  " Normal mode

" " Set cursor shape in different modes
" let &t_SI = "\e[5 q"  " Beam shape in Insert mode
" let &t_SR = "\e[3 q"  " Underline shape in Replace mode
" let &t_EI = "\e[2 q"  " Block shape in Normal mode

" Repeat Line/s below
" Insert Mode - single line at current
inoremap <C-c> <Esc>yypgi
" Visual Mode - can be single or multiple lines
vnoremap <C-c> y'>o<Esc>p='[v']gv
" Normal Mode - single line at current
nnoremap <C-c> yyP

" Undo
inoremap <C-S-z> <C-o>u
" Redo
inoremap <C-S-x> <C-o><C-r>

" Move the current line or selected lines down in Insert mode
" inoremap <silent> <C-s> <Esc>:m .+1<CR>==gi
" Visual Mode
xnoremap <silent> <C-s> :m '>+1<CR>gv=gv

" Move the current line or selected lines up in Insert mode
" inoremap <silent> <C-w> <Esc>:m .-2<CR>==gi
" Visual Mode
xnoremap <silent> <C-w> :m '<-2<CR>gv=gv

:colorscheme space-vim-dark

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'S',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'UM',
                \ 'Deleted'   :'X',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let NERDTreeShowHidden=1 " Shows hidden .files 

" nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <S-Tab> :NERDTreeToggle<CR>
" nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Map split navigation to simply Ctrl + direction
nnoremap <C-S-a> <C-w>h
nnoremap <C-S-s> <C-w>j
nnoremap <C-S-w> <C-w>k
nnoremap <C-S-d> <C-w>l

" Map split navigation in insert mode to Ctrl + direction
inoremap <C-S-a> <C-\><C-n><C-w>h
inoremap <C-S-s> <C-\><C-n><C-w>j
inoremap <C-S-w> <C-\><C-n><C-w>k
inoremap <C-S-d> <C-\><C-n><C-w>l

set completeopt-=preview " For No Previews:
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nmap <F8> :TagbarToggle<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
