" Basic Settings
set termguicolors
syntax on
set number
set hlsearch
set ignorecase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab
 
" Key Settings
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
 
" Key Setting - resize windows
nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>
 
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>
 
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
 
" Keep Plugin commands between vundle#begin/end.
 
" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'The-NERD-Tree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Raimondi/delimitMate'
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
 
" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
set laststatus=2 " turn on bottom bar
 
" The-NERD-Tree
nmap <F2> :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
 
" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
 
" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>
 
" delimitMate
let delimitMate_expand_cr=1

"============= ctags 설정 =======================
set tags=./tags,../tags,../../tags,/usr/include/tags,/usr/local/include/tags

if version >= 500
    func! Sts()
        let st = expand("<cword>")
        exe "sts ".st
    endfunc
    nmap ,st :call Sts()<cr>

    func! Tj()
        let st = expand("<cword>")
        exe "tj ".st
    endfunc
    nmap ,tj :call Tj()<cr>
endif


"============= 파일 버퍼 간 이동 ================
map ,1 :b!1<CR>             " 1번 파일 버퍼로 이동
map ,2 :b!2<CR>             " 2번 파일 버퍼로 이동
map ,3 :b!3<CR>             " 3번 파일 버퍼로 이동
map ,4 :b!4<CR>             " 4번 파일 버퍼로 이동
map ,5 :b!5<CR>             " 5번 파일 버퍼로 이동
map ,6 :b!6<CR>             " 6번 파일 버퍼로 이동
map ,7 :b!7<CR>             " 7번 파일 버퍼로 이동
map ,8 :b!8<CR>             " 8번 파일 버퍼로 이동
map ,9 :b!9<CR>             " 9번 파일 버퍼로 이동
map ,0 :b!0<CR>             " 10번 파일 버퍼로 이동
map ,x :bn!<CR>             " 다음 파일 버퍼로 이동
map ,z :bp!<CR>             " 이전 파일 버퍼로 이동
map ,w :bw<CR>             " 현재 파일 버퍼를 닫음

"============== key 매핑 ========================
map <F5> v]}zf              " 폴딩
map <F6> zo                 " 폴딩 해제
map <F3> :Tlist<cr><C-W><C-W>   " taglist
map <F4> :BufExplorer<cr>       " BufExplorer

"==================== man page 설정 ==================
func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>
