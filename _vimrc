"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') && has('gui_win32') && has('gui_running')
   let s:RUNTIME_DIR=s:RUNTIME_DIR
   au GUIEnter * simalt ~x
else
   let s:RUNTIME_DIR='~/.vim'
   au GUIEnter * call MaximizeWindow()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
exec 'set rtp+='.s:RUNTIME_DIR.'/bundle/vundle'
call vundle#rc()
call vundle#begin(s:RUNTIME_DIR.'/bundle/')
Bundle 'gmarik/vundle'
Bundle 'mru.vim'
Bundle 'ctags.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-Nerd-Tree'
Bundle 'The-Nerd-Commenter'
Bundle 'tagbar'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'xml.vim'
Bundle 'css.vim'
Bundle 'python.vim'
Bundle 'javascript.vim'
Bundle 'fencview.vim'
Bundle 'AutoClose'
Bundle 'MatchIt.zip'
Bundle 'STL-Syntax'
Bundle 'TagHighlight'
Bundle 'tpope/vim-fugitive'
"Bundle 'Shougo/neocomplete.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'hdima/python-syntax'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'davidhalter/jedi-vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'sirver/ultisnips'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'qiyu2580/vimcdoc'
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c.vim
let g:C_GlobalTemplateFile= s:RUNTIME_DIR.'/bundle/c.vim/c-support/templates/Templates'

" NERDTree
nn <silent><F6> :exec("NERDTree ".expand('%:h'))<CR>
nn <silent><F7> :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=s:RUNTIME_DIR.'/bundle/The-NERD-Tree/NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=31
let NERDTreeTitle='[NERD Tree]'
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" syntastics
nn <silent><F2> :UpdateTypesFile<CR>

" PowerLine
let g:Powerline_mode_V = 'VISUAL LINE'
let g:Powerline_mode_cv = 'VISUAL BLOCK'
let g:Powerline_mode_S = 'SELECT LINE'
let g:Powerline_mode_cs = 'SELECT BLOCK'

" TagBar
nnoremap <silent> <F8> :TagbarToggle<CR> 
let g:tagbar_right = 1
let g:tagbar_width = 30
autocmd VimEnter * nested :call tagbar#autoopen(1)  

" YouCompleteMe 
let g:ycm_global_ycm_extra_conf = s:RUNTIME_DIR.'/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=/data/misc/software/misc./vim/stdcpp.tags
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>

""neocomplete
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
    "\ }

"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplete#enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplete#enable_insert_char_pre = 1

"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1

"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"let g:cpp_class_scope_highlight = 1
"let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

set helplang=cn

nnoremap <silent> <F12> :A<CR>
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest
highlight Pmenu    guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black
set clipboard+=unnamed
"nmap <F2> :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pclint 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"comp! flint
"nnoremap <silent> <F11> :make<CR>:botright cope<cr>


nmap ,s :source s:RUNTIME_DIR/_vimrc<CR><ESC><ESC>  
nmap ,v e s:RUNTIME_DIR/_vimrc<CR>
set shortmess=atI


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on line numbers
set nu 

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2 

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans =0
let g:solarized_degrade   =0
let g:solarized_bold      =0
let g:solarized_underline =1
let g:solarized_italic    =0
colorscheme solarized
"colorscheme PaperColor

hi LineNr guifg=grey60
set cursorline

hi Statement ctermfg=3 guifg=khaki term=NONE gui=NONE 
hi Type term=underline ctermfg=2 gui=NONE guifg=darkkhaki 

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac
set t_Co=256

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h11:cDEFAULT
  endif
endif

map <silent> <F11>  :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" FuzzyFinder
map <leader>fb :FufBuffer<cr>
map <leader>fc :FufChangeList<cr>
map <leader>fd :FufDir<cr>
map <leader>ff :FufFile<cr>
map <leader>fh :FufHelp<cr>
map <leader>fj :FufJumpList<cr>
map <leader>fl :FufLine<cr>
map <leader>ft :FufTag<cr>
map <leader>fq :FufQuickfix<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Show all the buffers
map <leader>bs :ls<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=1
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal! g`\"" | endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status/Title line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ \ %{HasPaste()}FILE:\ %f%m%r%h%w\ \ CWD:\ %r%{getcwd()}%h\ \ Line:\ %l/%L\ \ Column:\ %c\ \   
set statusline=
set statusline+=%<%{HasPaste()}%F%m%r%h%w
set statusline+=%=
set statusline+=\|%-4{&ff}
set statusline+=\|%-4(%p%%%) 
set statusline+=\|%-23(row:%l/%L,col:%c%) 

set titlestring=VIM\ -\ [%r%{getcwd()}%h]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

map <leader>e :edit %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
 
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
