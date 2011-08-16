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

" scrollbars
set guioptions-=R
set guioptions-=L
set guioptions-=r
set guioptions-=l

set grepprg=ack

set hlsearch
set incsearch


colorscheme ir_black-custom
set number

if has("gui_running")
  if has('unix')
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      " Mac only settings
      set fuoptions=maxvert,maxhorz
      "colorscheme macvim
    else
      " Linux only settings
    endif
    " Mac and Linux only settings
  else
    " Windows only settings
  endif
  " GUI only settings
else
  " Terminal only settings
endif

" speelcheck
if has('gui_running')
  set spell
else
  " block highlighting can be annoying, but most languages now only check
  " comments and literal strings so I have enabled for cli use
  set spell
endif

" Enable tab complete for COMMANDS.
" first tab shows all matches. next tab starts cycling through the matches
set wildmenu
set wildmode=list:longest,full

set linebreak

"set smartindent
set cindent
set expandtab
set tabstop=2
set shiftwidth=2

" disables toolbar
set go-=T   " aside: go = guioptions

" default window size
if has('gui_running')
  set lines=35
  set columns=110
endif

nnoremap <C-z> :set foldmethod=indent<return>

nnoremap <C-n> :NERDTreeToggle<return>


" enable mouse right clicking (not needed in macvim, not sure if still
" compatible)
set mousemodel=popup


filetype indent on

autocmd BufEnter *.m    compiler mlint

" Octave Syntax
"augroup filetypedetect
"  au! BufRead,BufNewFile *.m    setfiletype octave
"augroup END

" Allow sudo writing of files
cmap w!! w !sudo tee >/dev/null %

" Scrollfix plugin settings
" Lock cursor to percentage of window
let g:scrollfix=55
let g:fixeof=0
let g:scrollinfo=1

" Spell check ignore tags
set tags+=tags;/
set spelllang=en,fromtags
cmap tagspell !ctags *.cpp *.c *.h; tagstospl.py -t tags fromtags

" taglist plugin settings
" Toggle Tag List
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type = "name"
nnoremap <silent> <c-c> :TlistToggle<cr>

" For use in : mode
" Allows running a command within a C/C++/Java function
cmap ;tf ?^{??(?,/^}/

" DoxygenToolkit settings
let g:DoxygenToolkit_authorName="Benjamin Bergman"

if filereadable("~/.vim/.vimrc.work")
  source ~/.vim/.vimrc.work
endif


" TwiddleCase
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
