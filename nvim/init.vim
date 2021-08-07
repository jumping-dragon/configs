call plug#begin()

"Widgets
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}	"TS-Server, JSON-Server, Etc.
Plug 'preservim/nerdtree'

"Syntaxes
Plug 'HerringtonDarkholme/yats.vim'	"TS Syntax

"Visuals

call plug#end()

set tabstop=4
set shiftwidth=4
set number
filetype plugin indent on
syntax enable
