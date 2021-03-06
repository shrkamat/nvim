set nocompatible
set tabstop=4

call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/cscope.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Nopik/vim-nerdtree-direnter'
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'chase/vim-ansible-yaml'
Plug 'plytophogy/vim-virtualenv'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'miyakogi/conoline.vim'
Plug 'cquery-project/cquery'
Plug 'vim-airline/vim-airline'
Plug 'buoto/gotests-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on

let g:deoplete#enable_at_startup = 1


" vim customized for shrkamat (regular users)
" https://superuser.com/questions/61226/configure-vim-for-copy-and-paste-keyboard-shortcuts-from-system-buffer-in-ubuntu

" :behave mswin

" cut copy paste
" vnoremap <C-X> "+x
" vnoremap <C-C> "+y
" map <C-V>      "+gP

let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<C-e>'], 'AcceptSelection("t")': ['<Cr>'],  }

" https://stackoverflow.com/questions/16154034/remapping-vim-end-of-line-key
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-Home> <Home>
inoremap <C-End> <End>

autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
let g:rustfmt_autosave = 1


" coc
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" skm bindings
let mapleader="f"
nmap <C-r> :!cargo -q run <CR>
nmap <F8> :TagbarOpenAutoClose <CR>
nmap <S-F8> : *
nnoremap <Leader><left> :tabNext<CR>
nnoremap <Leader><right> :tabnext<CR>
nnoremap <Leader>o :NERDTree<CR>          " file open


set relativenumber
set hlsearch

" some tweaks https://octetz.com/posts/vim-as-go-ide
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Better display for messages
set cmdheight=2

" NERDTree
let NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeQuitOnOpen=1
