set nocompatible
set tabstop=4

call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/cscope.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chase/vim-ansible-yaml'
Plug 'Rip-Rip/clang_complete'
Plug 'plytophogy/vim-virtualenv'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

filetype plugin indent on

let g:deoplete#enable_at_startup = 1


" vim customized for shrkamat (regular users)
" https://superuser.com/questions/61226/configure-vim-for-copy-and-paste-keyboard-shortcuts-from-system-buffer-in-ubuntu

" :behave mswin

" cut copy paste
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V>      "+gP

let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<C-e>'], 'AcceptSelection("t")': ['<Cr>'],  }

" https://stackoverflow.com/questions/16154034/remapping-vim-end-of-line-key
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-Home> <Home>
inoremap <C-End> <End>

" autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
