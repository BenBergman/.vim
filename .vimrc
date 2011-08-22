set nocp  "turns off Vi compatibility (always keep at top as it changes lots of settings)

" Determine operating system
if has('unix')
  let s:os = substitute(system("uname"), "\n", "", "")
  if s:os == "Darwin"
    s:os == "Mac"
  endif
else
  let s:os = "Windows"
endif

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


" Use 256 colour terminal
" Make sure to declare this before loading a colorscheme
set t_Co=256

if has('gui_running')
  colorscheme ir_black-custom
else
  colorscheme jellyx-custom "only until I update ir_black-custom to work with 256 colour terminals
endif

set number


if s:os == "Mac"
  set fuoptions=maxvert,maxhorz
  "colorscheme macvim
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


" Set a cursor column highlight
"set cursorcolumn  " disabled because it introduces noticeable lag when
                   " holding 'h' and 'l'
" Set a cursor line highlight
"set cursorline


" Allow switching of buffer without saving
" Also retains undo history
set hidden




" Persistent undo (vim 7.3 and newer)
try
  set undodir=$HOME/.vim/undodir "does this work in Windows?
  set undofile
catch
endtry


" When .vimrc is edited, reload it
if has('unix')
  autocmd! bufwritepost .vimrc source ~/.vimrc
else " Windows
  autocmd! bufwritepost _vimrc source $HOME/_vimrc " has not been verified
endif
