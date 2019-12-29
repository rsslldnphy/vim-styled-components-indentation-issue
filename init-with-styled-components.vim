set nocompatible
filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/vim-plug')

Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

set shiftwidth=2
