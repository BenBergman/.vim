set nocp  "turns off Vi compatibility (always keep at top as it changes lots of settings)
"set noea  "windows retain their size when a pane is opened or closed
syn on    "syntax highlighting

au BufNewFile,BufRead *.pde setfiletype java
au BufNewFile,BufRead *.tex set syntax=tex


set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

helptags ~/.vim/doc

"network
filetype plugin on  
let NERDTreeShowHidden=1

" rulers     
set guioptions-=R
set guioptions-=L
set guioptions-=r
set guioptions-=l
set grepprg=ack

set hlsearch
set incsearch

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  colorscheme IR_black-custom
"  colorscheme macvim
  set number
endif

colorscheme IR_black-custom
set number


" speelcheck
if has('gui_running')
  set spell
else
  " if can get spell check without having block highlighting, replace this
endif 

" Enable tab complete for COMMANDS.
" first tab shows all matches. next tab starts cycling through the matches
set wildmenu
set wildmode=list:longest,full

set linebreak

set expandtab
set tabstop=2
set shiftwidth=2
"set smartindent
set cindent

" disables toolbar
set go-=T   " aside: go = guioptions

" default window size
set lines=40
set columns=100

nnoremap <C-z> :set foldmethod=indent<return>

nnoremap <C-n> :NERDTreeToggle<return>

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE





