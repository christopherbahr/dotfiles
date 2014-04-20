set nocompatible

filetype off
"
"Neobundle stuff

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle'))

 " Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
"

"move around the file so fast
"NeoBundle 'Lokaltog/vim-easymotion'
"By Default it will use <Leader><Leader>
"let g:EasyMotion_leader_key='<Space>'

NeoBundle 'justinmk/vim-sneak'
let g:sneak#streak = 1

"make the sneak-streak labels make sense for Dvorak
let g:sneak#target_labels = "aoeuidhtnspyfgcrlqjkxbmwvzAOEUIDHTNSPYFGCRLQJKXBMWVZ"

nmap <Space> <Plug>SneakNext
nmap <C-Space> <Plug>SneakPrevious
xmap <Space> <Plug>VSneakNext
xmap <C-Space> <Plug>VSneakPrevious

"Replaces vim default f, t basically just makes it go across lines which is
"fantastic. Also can be repeated with space which is nice since I've broken ;
"replace 'f' with inclusive 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with exclusive 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

"follow case rules from ignorecase
let g:sneak#use_ic_scs = 1
"undocumented but this should turn off behaviour where you hit s, totally whiff
"on what you were trying to type, hit s again and go to the next match, then
"throw computer out the window in frustration. Instead it'll just let you sneak
"again. We already have <Space> and <C-Space> for repeating which is enough for
"me
let g:sneak#s_next = 0

"great for typing some stuff just as a quick note or to see something
"^that doesn't make any sense, ah well
NeoBundle 'mtth/scratch.vim'

"
"Comment out lines at the speed of thought
NeoBundle 'scrooloose/nerdcommenter'

"Syntax errors are for losers
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_ruby_checkers = ['ruby']
let g:syntastic_java_checker = 'javac'

"good for switching between buffers and files etc
NeoBundle 'Shougo/unite.vim'
let g:unite_source_history_yank = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

"This could be better but it's a good start. Starts to get weird after 15 but I
"don't normally work with that many buffers..
let g:unite_quick_match_table = {
      \ 'a' : 0, 'o' : 1, 'e' : 2, 'u' : 3, 'i' : 4, 'd' : 5, 'h' : 6,
      \ 't' : 7, 'n' : 8, 's' : 9,'p' : 10, 'y' : 11, 'f' : 12, 'g' : 13,
      \ 'c' : 14, 'r' : 15, 'l' : 16, 'q' : 17, 'j' : 18, 'k' : 19,'1' : 20,
      \ '2' : 21, '3' : 22, '4' : 23, '5' : 24, '6' : 25, '7' : 26, '8' : 27,
      \ '9' : 28, '0' : 29
      \}

"allegedly this makes it better, I don't entirely understand fuzzy matching but
"I have had some trouble with the matches displayed so issue 276 seems like it
"may fix it
call unite#filters#matcher_default#use(['matcher_fuzzy'])

"Allows asynchronous computations. Honestly I'm not sure if I'll ever use this
"myself but it lets unite make the list asynchronously instead of blocking which
"is nice
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Valloric/YouCompleteMe'

let g:ycm_global_extra_conf = '/home/chris/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'


let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

""""""""""""""""""""""""""""""""""""""
"       Old Autocomplete Stuff       "
""""""""""""""""""""""""""""""""""""""


"set omnifunc=syntaxcomplete#Complete

"tab for autocomplete
"Honestly I don't think I need the &completefunc stuff but if I ever add my onwn
"it should work nicely. Anyways this basically does what I want. It uses the
"context complete to try to be smart, it uses omnicomplete which is vim magic
"and it uses just normal c-p completion if all else fails.
"NeoBundle 'ervandew/supertab'
"Helps with delimitMate
"let g:SuperTabCrMapping = 0
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-p>"
"let g:SuperTabLongestEnhanced = 1


"NeoBundle 'vim-scripts/AutoComplPop'

NeoBundle 'vim-scripts/TeX-9'


"The Tim Pope section.. what a guy
"surrounding real good
NeoBundle 'tpope/vim-surround'
" LaTeX left right parentheses
autocmd FileType tex let g:surround_57 = "\\left( \r \\right)"
autocmd FileType tex let g:surround_48 = "\\left(\r\\right)"

"This allegedly makes rails development better
"(I've only done a tiny amount of ruby/rails development so it's hard to say"
NeoBundle 'tpope/vim-rails'

"PERL stuff
NeoBundle 'vim-perl/vim-perl'


"
"Git stuff
NeoBundle 'tpope/vim-fugitive'

"Make plugins repeat using . , lots of them use this and it's pretty easy to add
"support. Ref the readme if I have one that doesn't do what I want
NeoBundle 'tpope/vim-repeat'

"Browse tags, look at variables, functions, etc
NeoBundle 'majutsushi/tagbar'

"improve the status line
NeoBundle 'bling/vim-airline'
"show all the buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme="solarized"
"let g:airline#extensions#tmuxline#enabled = 1
"This makes it always show
set laststatus=2

"nice delimiter
NeoBundle 'Raimondi/delimitMate'

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"use ctrl-l to get out of delimiters, S-tab is used by YCM
"I'm not entirely sold on this mapping but I haven't come up with anything
"better yet
imap <C-l> <Plug>delimitMateS-Tab

"something about yanking like emacs?
"This should be replaced by Unite
"NeoBundle 'vim-scripts/YankRing.vim'

"Note YankRing breaks the beautiful nnoremap Y y$, we have to use the following
"function
"function! YRRunAfterMaps()
  "nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
"endfunction

"let g:yanking_history_dir = '/home/chris/.vim/bundle/YankRing.vim/'

nnoremap Y y$

"Visualize the undo tree because I don't really get it
NeoBundle 'sjl/gundo.vim'


"
"Colors
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'edkolev/tmuxline.vim'

let g:tmuxline_theme = 'solarized'

"Real men live life in hard mode
"Makes moving incorrectly a huge pain in the ass with a 1 second timeout every
"time you use jkhl or arrow keys
NeoBundle 'takac/vim-hardtime'
let g:hardtime_default_on = 1
"Even real men need a break when browsing undo trees or tags
let g:hardtime_ignore_buffer_patterns = [ "Gundo", "Tagbar" ]

NeoBundleCheck

"Snippets ala textmate note NeoBundleCheck has to come before this or else it
"breaks. I have no clue why. I couldn't be more confused
NeoBundle 'SirVer/ultisnips'
"Tell it where to look for snippets and use tab to cycle through pieces
let g:UltiSnipsSnippetsDir = '/home/chris/.vim/MySnippets'
let g:UltiSnipsExpandTrigger = "<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsListSnippets="<C-e>"

"Note we need both this and the ultisnipssnippetsdir to get it all to work
let g:UltiSnipsSnippetDirectories=["MySnippets","UltiSnips"]

"snippets are separated from the engine now so we need to get the defaults
"separately if we want them
NeoBundle 'honza/vim-snippets'

"I don't remember what this does... I should probably figure that out
NeoBundle 'vim-scripts/sudo.vim'

filetype plugin on
filetype indent on

" Setup latex stuff
let g:tex_flavor = 'latex'
let g:tex_nine_config = {'compiler': 'pdflatex', 'synctex': 1, 'viewer': {'app': 'evince', 'target': 'pdf'} }

"look for the tags file
set tags=./tags;/

"For *nix systems type w!! when you forgot to open xorg.conf as super user
cmap w!! w !sudo tee % >/dev/null

"Why are you wasting kestrokes hitting shift to get a colon?
"nnoremap ; :
"Just kidding I'm too used to using shift to type colon. It doesn't seem to
"actually slow me down

"Get the tabs working nicely
set autoindent
set smartindent
set wrap
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set smarttab

" search without case unless I put in a capital letter
set ignorecase
set smartcase
set incsearch
set hlsearch

"Get some better font going on
"I don't use a mac but hopefully I will one day
if has("gui_macvim")
  set guifont=Menlo
elseif has("gui_win32")
  set guifont=Consolas
elseif has("gui_running") "unix
  "set guifont=Inconsolata-dz\ for\ Powerline\ 11
  set guifont=Inconsolata\ 13
endif

"I don't like all the menuy nonsense but I do like the way gvim renders text
"This should help with that
set guioptions =c

"make the file thing better by default
set wildmode=longest,list,full

" Show line numbers
set number

"In case you're using another editor
set autoread

" Set this higher than standard because the lower corner of this screen sucks
set scrolloff=10

"Automatically wrap the line after 80 characters
set textwidth=80

"Show matching bracket
set showmatch

"maybe this is the annoying thing that in LaTeX?
"default is 60 which is a bit laggy
let g:matchparen_insert_timeout=5


"For working in the terminal. Give the terminal a more useful title
set title

"make regex better
set magic

"turn off annoying nonsense
set noerrorbells
set visualbell
set t_vb=
set tm=500

"turn on syntax
syntax enable

"Sweet colorscheme
"

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set background=dark
colorscheme solarized

"No backups 'cause I live on the edge
set nobackup
set nowb
set noswapfile



"encoding
set encoding=utf8

"make these work right (although with 80 char lines it shouldn't really matter)
map j gj
map k gk

"get backspace to work properly
set backspace=indent,eol,start

"don't close buffers whe I open a new one
set hidden

"Window Moving
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Leader Stuff
let mapleader = ","
let g:mapleader = ","


" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

"clear search highlight
noremap <silent> <leader>/ :nohlsearch<CR>

"edit vimrc
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>

"reload vimrc
nnoremap <silent> <leader>vr :so $MYVIMRC<CR>

"Show the tags
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>gu :GundoToggle<CR>



nnoremap <leader>ur :Unite -start-insert file_rec/async<CR>
nnoremap <leader>um :Unite file_mru<CR>
nnoremap <leader>uf :Unite -start-insert file<CR>
nnoremap <leader>ub :Unite -quick-match buffer<CR>
nnoremap <leader>uy :Unite history/yank<CR>

"Toggle HardTime
nnoremap <leader>ht :HardTimeToggle<CR>

"Toggle TouchPad (Coulomb)
nnoremap <leader>tp :!~/scripts/touchpad.sh<CR><CR>

"Toggle spell check
nnoremap <leader>sp :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>z 1z=
"Still spell check, this actually adds kestrokes which is typcially bad but
"dvorak puts the square brackets so gosh danged far away that I can never hit
"them accurately
nnoremap <leader>sn ]s
nnoremap <leader>sN [s

"paragraph motions, not perfect but they're a start
nnoremap <leader>{ {j
nnoremap <leader>} }k

"Open new line above/below cursor
"It seems like it's more intuitive to use o and O but with the dvorak keymap and
"comma being the leader key that's the same finger which is a pain in the ass
"So we'll use l and L for line
nnoremap <leader>L :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <leader>l :set paste<CR>m`o<Esc>``:set nopaste<CR>

"Scratch stuff
nnoremap <leader>sc :Scratch<CR>

"perltidy
nnoremap <leader>pt :%! perltidy<CR>
vnoremap <leader>pt :! perltidy<CR>

"surround, not sure if I'll use this. Note: don't change to nnoremap or it won't
"work (that makes sense since it'll ignore the surround.vim mappings in the
"nnoremap environment
nmap <leader>$ ys$

"remove trailing whitespace. This is especially useful for LaTeX files where you
"want to browse by paragraphs using the } motion. Note this restores the
"previous search buffer and sets :nohl so the space won't be highlighted
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"I think this will make it put the tags in the right spot..
set tags=./tags,tags;$HOME

"Ctags is fantastic. [ buttons are a huge pain to hit on dvorak though so I may
"need to figure out a better way. Although I have tagbar which may be
"enough..
"Additionally this doesn't seem to be working... Not really sure what's going on
"here
"
"Additionally Additionally it might be nice to run this asynchronously. Maybe
"neovim will save me from this one day. In the meantime there are plugins that
"are fantastically confusing.. I'll look into it
au BufWritePost *.php silent! !ctags-exuberant -R

au BufWritePost *.js, silent! !ctags-exuberant -R

au BufWritePost *.c,*.cc,*.cpp,*.h,*.hpp, silent! !ctags-exuberant -R &

"These are both buffer savers for when you switch
set autowriteall
au FocusLost * silent! wa

"LaTeX is suuuuper annoying with this. It makes it easier to read but its awful
"to edit because it keeps changing the number of characters. Anyone who can
"stand/work with this is a stronger person than me
set conceallevel=0
