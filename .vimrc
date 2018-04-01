runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
    syntax on 
	syntax enable
endif
colorscheme torte "colortheme for ubuntu on windows
"colorscheme torte "colortheme for ubuntu on macbook

" detect file type
filetype on
filetype plugin on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "have Vim load indentation rules and plugins according to the detected filetype
    filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

"set ignorecase 
"set smartcase       
set autowrite "auto save        
set autoindent        
"set smartindent     
set tabstop=4       
set softtabstop=4  
set shiftwidth=4  
set cindent " indent to meet C code structure     
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     
set expandtab "replace tab with blank
"set backspace=2    
set showmatch      
set linebreak     
set whichwrap=b,s,<,>,[,] 
"set hidden " Hide buffers when they are abandoned
"set mouse=a
set number            
"set previewwindow   
set history=50      

"-- encoding setting --
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set encoding=utf-8

set laststatus=2 
set ruler            

set showcmd   
set showmode 

"-- curson setting --
set cursorline "set cursor highlight for row
"set cursorcolumn "set cursor hightlight for column
"hi CursorColumn cterm=NONE ctermbg=green ctermfg=white guibg=darkred guifg=white
hi cursorline term=bold cterm=bold guibg=Grey40

"--find setting--
set incsearch       
set hlsearch   


"--ctags setting--
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file
"set tags+=~/test/tags 


"-- omnicppcomplete setting --
imap <F3> <C-X><C-O>
imap <F2> <C-X><C-I>
set completeopt=menu,menuone 
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 


"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' 
let Tlist_Use_Right_Window=1 
let Tlist_Show_One_File=0 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Process_File_Always=1 
let Tlist_Inc_Winwidth=0


"-- WinManager setting --
let g:winManagerWindowLayout='FileExplorer|TagList' 
"let g:persistentBehaviour=0 
nmap wm :WMToggle<cr> 


" -- MiniBufferExplorer --
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1   


"--fold setting--
set foldmethod=syntax 
set foldlevel=100 
set foldcolumn=5 


"-- QuickFix setting --
map <F6> :make clean<CR><CR><CR>
map <F7> :make<CR><CR><CR> :copen<CR><CR>
map <F8> :cp<CR>
map <F9> :cn<CR>
"imap <F6> <ESC>:make clean<CR><CR><CR>
"imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
"imap <F8> <ESC>:cp<CR>
"imap <F9> <ESC>:cn<CR>

"-- NERDTree setting --
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-N> :NERDTreeToggle<CR>

"-- Vundle setting --
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/echofunc.vim'
Plugin 'vim-scripts/minibufexplorerpp'
Plugin 'vim-scripts/cscope.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/jack/.vim/plugin'

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
