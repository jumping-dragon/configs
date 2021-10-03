call plug#begin()

"Widgets
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}	"TS-Server, JSON-Server, Etc. launcher
Plug 'preservim/nerdtree' "File Tree Widgets
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file search

"Syntaxes
Plug 'HerringtonDarkholme/yats.vim'	"TS Syntax
Plug 'tpope/vim-commentary'

"Visuals
Plug 'dracula/vim', {'name': 'dracula'}

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
noremap <leader>/ :Commentary<cr>

let g:rustfmt_autosave = 1

colorscheme dracula
set tabstop=4
set shiftwidth=4
set number
filetype plugin indent on
syntax enable
