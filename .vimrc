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
colorscheme delek 

" detect file type
filetype on
filetype plugin on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "have Vim load indentation rules and plugins according to the detected filetype
    filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

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
hi cursorline term=bold cterm=bold guibg=Grey40

"-- find setting --
set incsearch       
set hlsearch   

"-- key map --
:noremap <C-H> <C-W><C-H>
:noremap <C-L> <C-W><C-L>
:noremap <C-A> :qa<CR>
:noremap <F3> :TlistToggle<CR>:NERDTreeToggle<CR>:SrcExplToggle<CR>
:noremap <F4> :set nu!<CR>:set paste!<CR>
"auto complete brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

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

"-- QuickFix setting --
map <F6> :make clean<CR><CR><CR>
map <F7> :make<CR><CR><CR> :copen<CR><CR>
map <F8> :cp<CR>
map <F9> :cn<CR>

"-- Pydiction setting --
" Plugin for Python auto complete
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict' 

"-- SrcExpl setting --
source ~/.vim/.se.vimrc

"-- Taglist/ctags setting --

map <F12> :!/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *<CR>                                             

set tags=tags
set tags+=./tags "add current directory's generated tags file
let Tlist_Ctags_Cmd='ctags' 
let Tlist_Use_Right_Window=0 
let Tlist_Show_One_File=0 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Process_File_Always=1 
let Tlist_Inc_Winwidth=0

autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.c :TlistUpdate
autocmd BufWritePost *.h :TlistUpdate
autocmd BufWritePost *.jce :TlistUpdate

"-- NERDTree setting --
"Let NerdTree show on right
let NERDTreeWinPos="right"
"Let NerdTree show Bookmarks when opened
let NERDTreeShowBookmarks=1

autocmd vimenter *.cpp NERDTree
autocmd vimenter *.cpp Tlist
autocmd vimenter *.cpp SrcExpl
autocmd VimEnter *.cpp wincmd w

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Function for NerdTree + Taglist (auto close when 2 windows)
function! CheckLeftBuffers()
    if tabpagenr('$') == 1
        let i = 1
        while i <= winnr('$')
            " echom getbufvar(winbufnr(i), '&buftype')
            if getbufvar(winbufnr(i), '&buftype') == 'help' ||
                        \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
                        \ exists('t:NERDTreeBufName') &&
                        \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
                        \ bufname(winbufnr(i)) == '__Tag_List__' ||
                        \ bufname(winbufnr(i)) == 'Source_Explorer' || 
                        \ getwinvar(i, 'SrcExpl') == 1
                let i += 1
            else
                break
            endif
        endwhile
        if i == winnr('$') + 1
            qall
        endif
        unlet i
    endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

"-- Vundle setting --
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
call vundle#begin()
source ~/.vim/.vundle.vimrc
call vundle#end()
"alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

filetype plugin indent on     " required
