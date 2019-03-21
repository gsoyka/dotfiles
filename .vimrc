set expandtab
set shiftwidth=4
set softtabstop=4
set wildignore+=*.pyc,*.pyo,*.o
set mouse=a
set number


set clipboard=unnamed

"Behave like vim stead of vi
"set nocompatible

syntax on
set showcmd
set wildmenu

"Highlight searches (use Ctrl+L to temporarily turn off highlighting
set hlsearch
nnoremap <C-L> :nohl<CR><C-L>

set t_Co=256

"Use case insensitve search, except when using capital letters
set ignorecase
set smartcase
"Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Indent hardtab express settings
set expandtab
set shiftwidth=4
set softtabstop=4
set number
set wildignore+=*.pyc,*.pyo,*.o
set mouse=a
hi Search ctermbg=LightBlue
set ruler

if(!has('gui_running') && exists(':CSApprox'))
    CSApprox
endif

" Search for highlighed text
vnoremap // y/<C-R>"<CR>

" Run python3
nnoremap <silent> <F5> :w <CR> :!python3 %<CR>

""""" Vundle Vim
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'dracula/vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on


""""" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Autoclose VIM if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1

""""" Syntastic

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0

"""" Solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

" Search and put results in new buffer
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | tabedit | setlocal bt=nofile | put! a

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
