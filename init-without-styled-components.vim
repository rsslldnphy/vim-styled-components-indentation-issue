set nocompatible
filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/vim-plug')

Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()
			
set shiftwidth=2
