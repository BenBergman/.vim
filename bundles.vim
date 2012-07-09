set nocompatible  "turns off Vi compatibility (always keep at top as it changes lots of settings)

filetype on       "needed for vim on mac?
filetype off      "required for vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required for vundle
Bundle 'gmarik/vundle'

" Bundles can be listed as vim-scripts repositories
"   Bundle 'Align'
" as GitHub repositories
"   Bundle 'tpope/vim-fugitive'
" or as full git URLs
"   Bundle 'git://repo.or.cz/vcscommand'

" Tag highlighting
"Bundle 'abudden/TagHighlight'
Bundle 'xolox/vim-easytags'

" Tag List
"Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'ervandew/taglisttoo'

" Version control tools
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sudar/vim-scmdiff'
Bundle 'git://repo.or.cz/vcscommand'

" Text formatting tools
Bundle 'tpope/vim-surround'
Bundle 'Align'
Bundle 'keepcase.vim'
Bundle 'VisIncr'
Bundle 'AndrewRadev/linediff.vim'

" File management tools
Bundle 'scrooloose/nerdtree'
Bundle 'bufexplorer.zip'

" Extra controls/commands
Bundle 'tpope/vim-unimpaired'
" Remap <Space> to repeat motions
Bundle 'spiiph/vim-space'
"
" Improves the appearance of the statusline
Bundle 'Lokaltog/vim-powerline'

" Code documentation tools
Bundle 'DoxygenToolkit.vim'
Bundle 'doxygen-support.vim'

" Colour schemes
Bundle 'freya'
"Bundle 'guns/jellyx.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'xoria256.vim'
Bundle 'croaker/mustang-vim'
Bundle 'BenBergman/ir_black-custom'
Bundle 'BenBergman/jellyx.vim'
Bundle 'BenBergman/vsearch.vim'
"
" Syntax
Bundle 'Arduino-syntax-file'
Bundle 'octave.vim--'
Bundle 'vbnet.vim'

" Other
Bundle 'connermcd/VimRepress'
Bundle 'mileszs/ack.vim'
Bundle 'xolox/vim-shell'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'dahu/LearnVim'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required for vundle

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
