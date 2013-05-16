set nocompatible  "turns off Vi compatibility (always keep at top as it changes lots of settings)

filetype on       "needed for vim on mac?
filetype off      "required for vundle

let g:vundle_default_git_proto = 'git'

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
Bundle 'BenBergman/TagHighlight'
"Bundle 'xolox/vim-easytags'

" Tag List
"Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'ervandew/taglisttoo'

" Version control tools
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
"Bundle 'sudar/vim-scmdiff'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'sjl/gundo.vim'

" Text formatting tools
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Align'
Bundle 'keepcase.vim'
Bundle 'VisIncr'
Bundle 'AndrewRadev/linediff.vim'
Bundle 'tpope/vim-abolish'
Bundle 'IndentTab'

" Snipmate (with requirements loaded first)
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
"Bundle 'garbas/vim-snipmate'
Bundle 'SirVer/ultisnips'

" File management tools
Bundle 'scrooloose/nerdtree'
Bundle 'bufexplorer.zip'

" Extra controls/commands
Bundle 'tpope/vim-unimpaired'
" Remap <Space> to repeat motions
Bundle 'spiiph/vim-space'
Bundle 'edsono/vim-matchit'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'myusuf3/numbers.vim'

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
Bundle 'tpope/vim-vividchalk'
Bundle 'altercation/vim-colors-solarized'

Bundle 'BenBergman/vsearch.vim'

" Syntax/language
Bundle 'Arduino-syntax-file'
Bundle 'octave.vim--'
Bundle 'vbnet.vim'
"Bundle 'skammer/vim-css-color'
Bundle 'chrisbra/color_highlight'
Bundle 'scrooloose/syntastic'
Bundle 'chrisbra/csv.vim'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'rantenki/vim-openscad'

" Other
Bundle 'connermcd/VimRepress'
Bundle 'mileszs/ack.vim'
Bundle 'xolox/vim-shell'
Bundle 'benmills/vimux'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'dahu/LearnVim'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required for vundle

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
