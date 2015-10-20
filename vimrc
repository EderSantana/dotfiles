" Backspace works
set t_Co=256
set backspace=indent,eol,start
" Line number
set number
" Leader keys
let mapleader = "'"
let maplocalleader = '\'
" No shifts for :
noremap ; :
noremap ;; ;

" Edit vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>st :source %<cr>


" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle/vundle"))
    call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'wakatime/vim-wakatime'
Bundle 'scrooloose/syntastic'
Bundle 'edersantana/vim-slime'
Bundle 'ivanov/vim-ipython'
Bundle 'kien/ctrlp.vim'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
"Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-git'
Bundle 'ervandew/supertab'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'wincent/Command-T'
"Bundle 'weynhamz/vim-plugin-minibufexpl'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'bling/vim-airline'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'nanotech/jellybeans.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'bling/vim-bufferline'
Plugin 'wincent/terminus'
Plugin 'sirver/ultisnips'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'suan/vim-instant-markdown'
Plugin 'plasticboy/vim-markdown'
Plugin 'sloria/vim-ped'
Plugin 'junegunn/seoul256.vim'
Plugin 'tomasr/molokai'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-repeat'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'jaxbot/semantic-highlight.vim'

if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

filetype plugin indent on " detect file type and load indents and plugins
syntax on                 " turn on syntax highlighting
syntax enable
colorscheme molokai    " syntax highlighting colours
set cursorline            " don't lose yourself
set expandtab             " enter spaces when tab is pressed
set textwidth=80          " break lines when line length increases
set tabstop=4             " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4          " number of spaces to use for auto indent
set autoindent            " copy indent from current line when starting a new line
set autoread              " auto reload buffer when file modified externally
set clipboard=unnamed     " yank and paste using system clipboard
set encoding=utf-8        " default char encoding
set lazyredraw

let g:molokai_original = 1
" let g:rehash256 = 1


"""""""""""
" Thesaurus
"""""""""""
nnoremap <LocalLeader>k :OnlineThesaurusCurrentWord<CR>
vnoremap <LocalLeader>k y:Thesaurus <C-r>"<CR>

"""""""""""
" slime
"""""""""""
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
"let g:slime_cell_delimiter = "##"

"""""""""""
" airline
"""""""""""
set guifont=Hack
set laststatus=2 " always show statusline
let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#tabline#enabled = 1 " show open buffers
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" vim-powerline symbols
"let g:airline_left_sep = '⮀'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = '⮃'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_y = airline#section#create(['%p', '%%'])
let g:airline_section_z = airline#section#create_right(['%l', '%c'])

""""""""""
" Plugins
""""""""""

" Pydoc, TaskList, Gundo
map <leader>pd <Plug>Pydoc
map <leader>td <Plug>TaskList
nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

" NERDTree
map <leader>t :NERDTreeToggle<CR>
hi Directory guifg=#FF0000 ctermfg=red
let NERDTreeIgnore = ['\.pyc$']
" let NERDTreeMapOpenInTab='<ENTER>'

" SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletiontype = "context"
set completeopt=menuone,longest,preview

" Fugitive
set statusline+=%{fugitive#statusline()}

" py.test
nmap <silent><leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Syntastic
" Default settings from their github
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UltiSnips
nnoremap <C-b> <esc>
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

" vim-markdown
let g:vim_markdown_math=1

""""""""""""""""""""
" Extra key bindings
""""""""""""""""""""
" Move between open buffers easier
noremap <C-i> :bp<CR>
noremap <C-o> :bn<CR>
noremap <Leader>d :bd!<CR>:bp<CR>

" Move between vertical splits easier
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Highlight characters when lines get too long
augroup LongLines
    autocmd!
    autocmd FileType * match none
    autocmd FileType python,vim match ErrorMsg '\%>120v.\+'
    autocmd FileType html,htmldjango match ErrorMsg '\%>100v.\+'
augroup END

autocmd FileType html :set tw=120

" Automatically wrap text while typing in Markdown and rST documents
autocmd! BufNewFile,BufReadPost *.md set filetype=markdown
autocmd! Filetype markdown,rst set textwidth=79

" Remove trailing whitespace and empty lines at end of file
augroup whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e
augroup END

""""""""""""""""""""""""""""""""""""""""""
" Navigate tmux and vim with the same keys
""""""""""""""""""""""""""""""""""""""""""
function! s:NavigateTermSplits(direction)
    let windowNumber = winnr()
    execute 'wincmd ' . a:direction
    if windowNumber == winnr()
        silent call system('tmux select-pane -' . tr(a:direction, 'hjkl', 'LDUR'))
    endif
endfunction

nnoremap <silent> <C-h> :call <SID>NavigateTermSplits('h')<CR>
nnoremap <silent> <C-j> :call <SID>NavigateTermSplits('j')<CR>
nnoremap <silent> <C-k> :call <SID>NavigateTermSplits('k')<CR>
nnoremap <silent> <C-l> :call <SID>NavigateTermSplits('l')<CR>

"""""""""""""""
" Vim slime
"""""""""""""""
nnoremap <C-c><cr> ma<C-c><C-c>`a

""""""""""""""""""""""""""""""""
" Markdown to PDF - Needs pandoc
""""""""""""""""""""""""""""""""
autocmd BufWritePost *.md execute "!pandoc -o " . expand("%:r") . ".pdf " . expand("%") . " &"
au FocusGained * :redraw!
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us

""""""""""""""""""""""""""""""""
" My Github
""""""""""""""""""""""""""""""""
nnoremap <leader>gh :e ~/python/

""""""""""""""""""""""""""""""""
" Highlight non-ascii chars
""""""""""""""""""""""""""""""""
highlight nonascii guibg=Red ctermbg=1 term=standout
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"
