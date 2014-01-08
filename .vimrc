set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'Shougo/vimproc'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'scrooloose/syntastic'
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'majutsushi/tagbar'
Bundle 'bitc/lushtags'
" Bundle 'zenzike/vim-haskell'
" Bundle 'laurilehmijoki/haskellmode-vim'
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"

set nofoldenable

"
" disable all conceals, including the simple ones like
" lambda and composition
let g:haskell_conceal = 0
"
" disable concealing of "enumerations": commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
let g:haskell_conceal_enumerations = 0

let g:haskell_autotags = 1
let g:haskell_tags_generator = "hasktags"

let g:haddock_browser = "lynx"
let g:haddock_docdir = expand("~/.cabal/share/doc")

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" Фолдинг по отсупам
set foldmethod=indent
set foldlevelstart=99 

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=5

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=5

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=   

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Кодировка текста по умолчанию
set termencoding=utf-8

" Сделать заметным режим вставки
"
set nocursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

let NERDTreeIgnore = ['\.pyc$', '\.o']

function! IDocWithRefresh(name) 
  call IDoc(a:name)
  redraw!
endfunction 

nmap ?t :GhcModType<cr>
nmap ?T :GhcModTypeClear<cr>
nmap ?I :GhcModTypeInsert<cr>
nmap ?i :GhcModInfo<cr>
nmap ?h :call IDocWithRefresh("<c-r>=expand("<cword>")<cr>")<cr>

" F3 - просмотр ошибок
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F8 - change current directory to directory of current file
map <F8> :cd %:p:h<cr>
vmap <F8> <esc>:cd %:p:h<cr>
imap <F8> <esc>:cd %:p:h<cr>

" F9 - "make" команда
map <F9> :wa<cr><esc>:make<cr>
vmap <F9> <esc>:wa<cr><esc>:make<cr>i
imap <F9> <esc>:wa<cr><esc>:make<cr>i

function! ToggleBars()
  NERDTreeToggle
  Tagbar
endfunction 

" F10 - toggle bars
nmap <F10> :call ToggleBars()<cr>
vmap <F10> <esc>:call ToggleBars()<cr>
imap <F10> <esc>:call ToggleBars()<cr>
