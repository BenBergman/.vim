set nocompatible  "turns off Vi compatibility (always keep at top as it changes lots of settings)

filetype on       "needed for vim on mac?
filetype off      "required for vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required for vundle
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'mileszs/ack.vim'
"Bundle 'abudden/TagHighlight'
Bundle 'xolox/vim-easytags'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
"Bundle 'ervandew/taglisttoo'
Bundle 'xolox/vim-shell'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'Align'
Bundle 'bufexplorer.zip'
Bundle 'DoxygenToolkit.vim'
Bundle 'doxygen-support.vim'
Bundle 'keepcase.vim'
Bundle 'taglist.vim'
Bundle 'VisIncr'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
Bundle 'git://repo.or.cz/vcscommand'
"Bundle 'git://git.wincent.com/command-t.git'
" colour schemes
Bundle 'freya'
"Bundle 'guns/jellyx.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'xoria256.vim'
Bundle 'BenBergman/ir_black-custom'
Bundle 'BenBergman/jellyx.vim'
" syntax
Bundle 'Arduino-syntax-file'
Bundle 'vbnet.vim'
" ...

filetype plugin indent on     " required for vundle
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
