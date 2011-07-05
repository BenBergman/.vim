set nocp  "turns off Vi compatibility (always keep at top as it changes lots of settings)
"set noea  "windows retain their size when a pane is opened or closed

"turn on doxygen syntax highlighting
let g:load_doxygen_syntax=1
syn on    "syntax highlighting

"au BufNewFile,BufRead *.pde setfiletype java
au BufNewFile,BufRead *.pde setlocal ft=arduino
au BufNewFile,BufRead *.tex set syntax=tex

"automatically change working directory to directory containing buffer
autocmd BufEnter * lcd %:p:h

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
  if has('unix')
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      set fuoptions=maxvert,maxhorz
    endif
  endif
  colorscheme ir_black-custom
"  colorscheme macvim
  set number
endif

colorscheme ir_black-custom
set number


" speelcheck
if has('gui_running')
  set spell
else
  " block hilighting can be annoying, but most languages now only check
  " comments and literal strings so I have enabled for cli use
  set spell
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
if has('gui_running')
  set lines=40
  set columns=120
endif

nnoremap <C-z> :set foldmethod=indent<return>

nnoremap <C-n> :NERDTreeToggle<return>

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE


" enable mouse right clicking (not needed in macvim, not sure if still
" compatible)
set mousemodel=popup


filetype indent on

autocmd BufEnter *.m    compiler mlint

" Octave Syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m    setfiletype octave
augroup END
