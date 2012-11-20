" .vimrc
" 1. Be iMproved {{{
set nocompatible  "turns off Vi compatibility (always keep at top as it changes lots of settings)
" }}}
" 2. Determine operating system {{{
if has('unix')
  let s:os = substitute(system("uname"), "\n", "", "")
  if s:os == "Darwin"
    let s:os = "Mac"
  endif
else
  let s:os = "Windows"
  set runtimepath^=~/.vim
endif
" }}}
" 3. Vundle and Bundle configuration {{{
try
  source ~/.vim/bundles.vim
catch
endtry
" }}}
" Invert number/symbol keys while in insert mode {{{
" You aren't hard coding your variables, are you?

inoremap 1 !
inoremap 2 @
inoremap 3 #
inoremap 4 $
inoremap 5 %
inoremap 6 ^
inoremap 7 &
inoremap 8 *
inoremap 9 (
inoremap 0 )

inoremap ! 1
inoremap @ 2
inoremap # 3
inoremap $ 4
inoremap % 5
inoremap ^ 6
inoremap & 7
inoremap * 8
inoremap ( 9
inoremap ) 0

" }}}
" Make wrapped lines act nicer {{{

" Let partial lines scroll at window edges
set display+=lastline

" Make wrapped lines look nicer (or at least easier to spot)
" TODO: make the count a function of the current indenting level and tabstop
let &showbreak=repeat('> ', 5)

" Swap g <j|k> with <j|k>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

" }}}
" Map <C-?> to navigate windows (where ? is each of hjkl) {{{

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" }}}

"set noea  "windows retain their size when a pane is opened or closed

"turn on doxygen syntax highlighting
let g:load_doxygen_syntax=1
syn on    "syntax highlighting

"au BufNewFile,BufRead *.pde setfiletype java
au BufNewFile,BufRead *.pde setlocal ft=arduino
au BufNewFile,BufRead *.ino setlocal ft=arduino
au Filetype arduino set errorformat^=\%-G%.%#/usr/share/arduino/%.%#
au Filetype arduino set makeprg=scons " use scons for the :make command (uses the arscons SConstruct file from here: http://arscons.googlecode.com/git/SConstruct)
au BufNewFile,BufRead *.tex set syntax=tex

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Compile coffescript on write
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

"automatically change working directory (pwd) to directory containing buffer
"autocmd BufEnter * lcd %:p:h  "disabled so that working in a project
                               "directory makes more sense (ie. pwd not
                               "constantly changing)

"network
"let NERDTreeShowHidden=1

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
  "colorscheme jellyx-custom "only until I update ir_black-custom to work with 256 colour terminals
  colorscheme jellyx "only until I update ir_black-custom to work with 256 colour terminals
endif

set number


if has('gui_running') && s:os == "Mac"
  set fuoptions=maxvert,maxhorz
  "colorscheme macvim
endif


" speelcheck
if has('gui_running')
  set spell
else
  " block highlighting can be annoying, but most languages now only check
  " comments and literal strings so I have enabled for cli use
  " jellx colorscheme also does an ok job with spellcheck indication
  set spell
endif

" Enable tab complete for COMMANDS.
" first tab shows all matches. next tab starts cycling through the matches
set wildmenu
set wildmode=list:longest,full

set linebreak

"set smartindent
set cindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set noexpandtab

" Command to convert leading spaces into tabs (arg is the number of existing
" spaces per tab character)
" From http://vim.wikia.com/wiki/Super_retab
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Command to expand tabs only if non-leading (ie. non-indent) tabs.
" Useful for aligning things that are at the same indent level.
" Commented out as map conflicts with SnipMate and only 7.3 compatible
"function! IndentPlix()
"	let line = getline('.')
"	if line =~ '^\t*$'
"		return "\<tab>"
"	else
"		" Function only work in 7.3
"		let length = strdisplaywidth(line)
"		let spaces = &ts - (length % &ts)
"		return repeat(' ', spaces)
"	endif
"endfunction
"
"inoremap <expr> <Tab> IndentPlix()


" disables toolbar
set guioptions-=T

" disables menubar
set guioptions-=m


nnoremap <C-z> :set foldmethod=indent<return>

nnoremap <C-n> :NERDTreeToggle<return>


map <C-c> <Esc>
smap <C-c> <Esc>


" enable mouse right clicking (not needed in macvim, not sure if still
" compatible)
set mousemodel=popup



"autocmd BufEnter *.m    compiler mlint

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

" Keep x number of lines visible above and below the cursor
set scrolloff=4

" Spell check ignore tags
set tags+=tags;/
set spelllang=en
if filereadable("~/.vim/spell/fromtags.utf-8.spl")
  set spelllang+=fromtags
endif
cnoremap tagspell !ctags *.cpp *.c *.h; tagstospl.py -t tags fromtags; set spelllang+=fromtags

" tagbar plugin settings
" Toggle Tagbar
nnoremap <silent> <c-p> :TagbarToggle<CR>

"" taglist plugin settings
"" Toggle Tag List
"let Tlist_Use_Right_Window=1
"let Tlist_Sort_Type = "name"
"nnoremap <silent> <c-p> :TlistToggle<cr>
"
"" taglisttoo plugin settings
"" Toggle Tag List
"let g:TaglistTooPosition='right'
"let Tlist_Sort_Type = "name"
"nnoremap <silent> <c-p> :TlistToo<cr>


" QuickList settings {{{

" Make quickfix window play nice with right column panes (ie. taglist)
cnoremap copen botright copen
cnoremap cwindow botright cwindow
cnoremap cw botright cwindow

" Turn off spell check in the quickfix buffer
autocmd Filetype qf setlocal nospell
autocmd Filetype qf setlocal nobuflisted

" }}}

" For use in : mode
" Allows running a command within a C/C++/Java function
cmap ;tf ?^{??(?,/^}/

" DoxygenToolkit settings
let g:DoxygenToolkit_authorName="Benjamin Bergman"

if filereadable("~/.vim/.vimrc.local")
  source ~/.vim/.vimrc.local
endif


" TwiddleCase
" disabled because:
" - breaks in visual block mode over multiple lines
" - does not include original capitalization or inverted in cycle
"function! TwiddleCase(str)
"  if a:str ==# toupper(a:str)
"    let result = tolower(a:str)
"  elseif a:str ==# tolower(a:str)
"    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
"  else
"    let result = toupper(a:str)
"  endif
"  return result
"endfunction
"vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv


" Set a cursor column highlight
"set cursorcolumn  " disabled because it introduces noticeable lag when
                   " holding horizontal movement keys that change the
                   " column
" Set a cursor line highlight
set cursorline


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
" TODO: Moved to .vimrc at the top of this file, so a single command might suffice
if has('unix')
  autocmd! bufwritepost .vimrc source ~/.vimrc
else " Windows
  autocmd! bufwritepost _vimrc source $HOME/_vimrc " has not been verified
endif




" vcscommand options {{{

let VCSCommandCVSDiffOpt="u"

" }}}
" Find and replace last search query {{{

" Takes whatever was last searched for and does
" a find and replace for what you type next
" Useful with the * command
map <leader>r <Esc>:%s/\(<C-r>/\)//g<left><left>
map <leader>R <Esc>:%s/\(<C-r>/\)//gc<left><left><left>

" }}}
" Mappings for linediff plugin {{{

vnoremap <leader>ld :Linediff<CR>
nnoremap <leader>ld V:Linediff<CR>
noremap <leader>ldr :LinediffReset<CR>

" }}}
" Make the enter key temporarily clear the search highlighting {{{

nnoremap <CR> :nohlsearch<CR><CR> " extra <CR> retains stock functionality

" }}}
" Enable the mouse in compatible terminals {{{

set mouse=a

" }}}
" Use system clipboard as the default register {{{

" NOTE: In X, the "*" buffer is the selection (ie. middle click) buffer and
"       the "+" buffer is the cut (ie. clipboard) buffer. In Windows, both
"       function the same.
set clipboard=unnamed

" }}}


" Highlight trailing whitespace {{{

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" }}}

" Alias for gundo {{{

nnoremap <leader>u :GundoToggle<CR>

" }}}

" Fix conflict between vim-css-color and easytags {{{

let g:cssColorVimDoNotMessMyUpdatetime = 1

" }}}

" Diff options {{{

set diffopt+=vertical  " force vertical diff splits

" }}}

" Ex command aliases {{{

" Common typo correction
command! -nargs=0 W
\ w

" Qt makefile generation
command! -nargs=* Qmake
\ !qmake <args>

" }}}

" VimRepress (Wordpress plugin) settings {{{

let VIMPRESS = [{'username':'ben', 'blog_url':'https://blog.benbergman.ca'}]
let VIMREPRESS = VIMPRESS

" }}}

" Setup statusline {{{

" Always show statusline
set laststatus=2
" use the default statusline plus the fugitive and tagbar additions
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%{tagbar#currenttag('[%s]','')}%=%-14.(%l,%c%V%)\ %P
" stuff for Powerline
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" }}}


" Highlight lines in excess of 80 characters {{{

" from here: http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" I'm not sure I like the colorcolumn method...
if exists('+colorcolumn')
  set colorcolumn=80
else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

" }}}
"
" Show the name of the keyword type (for syntax highlighting purposes)
" directly under cursor (useful for editing colour schemes) {{{

map <F8> :echo synIDattr(synID(line("."),col("."),1),"name")<cr>

" }}}

" Enable modelines {{{

set modeline

" }}}
