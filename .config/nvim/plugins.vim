" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

    " UI / Navigation
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'justinmk/vim-sneak'
    Plug 'christoomey/vim-tmux-navigator'
    " Plug 'edkolev/tmuxline.vim'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'moll/vim-bbye'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-projectionist'
    Plug 'noahfrederick/vim-composer'
    Plug 'noahfrederick/vim-laravel'
    Plug 'ChristianChiarulli/far.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'chriskempson/base16-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'machakann/vim-highlightedyank'
    " Plug 'chrisbra/Colorizer'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'voldikss/vim-floaterm'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'liuchengxu/vim-which-key'
    Plug 'mbbill/undotree'
    Plug 'godlygeek/tabular'
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    "  Coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Snippets
    Plug 'honza/vim-snippets'
    " language
    Plug 'shadkaske/vim-blade', { 'for': ['php', 'blade'] }
    Plug 'Valloric/MatchTagAlways', {'for': ['php', 'html', 'blade']}
    Plug 'vim-vdebug/vdebug', { 'for': ['php'] }
    Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    Plug 'janko/vim-test'
    Plug 'baskerville/vim-sxhkdrc'
    " Plug 'vim-python/python-syntax', { 'for': 'python'}
    " Plug 'benmills/vimux'
    " Plug 'othree/html5.vim', { 'for': ['html', 'php'] }
    " Plug 'pangloss/vim-javascript', { 'for': ['javascript','html', 'php'] }
    " Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript','html', 'php'] }
    " Plug 'elzr/vim-json', { 'for': ['json', 'php'] }
    " Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    " Plug 'hail2u/vim-css3-syntax', { 'for': ['javascript','html', 'php'] }
    " Plug 'idanarye/vim-merginal'
    " Plug 'pprovost/vim-ps1'
    " Plug 'chr4/nginx.vim'
    " Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'javascriptn', 'css']}
    " Plug 'StanAngeloff/php.vim', { 'for': ['php', 'html'] }
    " Plug 'beanworks/vim-phpfmt', { 'for': ['php'] }
    " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'junegunn/vim-easy-align'

call plug#end()

" Automatically install missing plugins on startup
" autocmd VimEnter *
"   \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \|   PlugInstall --sync | q
"   \| endif
