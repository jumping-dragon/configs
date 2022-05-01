call plug#begin()

"Widgets
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}	"TS-Server, JSON-Server, Etc. launcher
"Plug 'preservim/nerdtree' "File Tree Widgets
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file search

"Syntaxes
Plug 'HerringtonDarkholme/yats.vim'	"TS Syntax
Plug 'tpope/vim-commentary'

"Visuals
Plug 'dracula/vim', {'name': 'dracula'}

call plug#end()

"nnoremap <C-t> :NERDTreeToggle<CR>
noremap <leader>/ :Commentary<cr>

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-rust-analyzer', 'coc-emmet', 'coc-tslint', 'coc-prettier']
let g:dracula_colorterm = 0

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Enable Color Scheme
colorscheme dracula

" Tabs and Line Numbers
set tabstop=4
set shiftwidth=4
set number

" Permanent undo
set undodir=~/.vimdid
set undofile

" Syntax Detection
filetype plugin indent on
syntax enable
