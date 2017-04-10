" what is termguicolors?
"set termguicolors

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'brhs/butter'
" On-demand loading
Plug 'scrooloose/nerdtree'          ", { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'      " nerdtree-tabs is a lot better than regular nerd tree
Plug 'VAlloric/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" xml edit plugin doesn't work :(
" Plug 'sukima/xmledit'
" Initialize plugin system
call plug#end()

let g:mapleader=','

" show line numbers
set number
set tw=79 " text width used by gd
set nowrap
set fo-=t " don't automatically wrap when typing

" convert tabs into spaces
set expandtab

" one tab= 2 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" highlight search text
set hlsearch

" enable incremental search
set incsearch

set ignorecase
set smartcase

" ==============================================================================================
" syntax highlighting
" ==============================================================================================
filetype off "????
filetype plugin indent on
syntax on

" ==============================================================================================
" Clipboard
" ==============================================================================================
set clipboard=unnamed  " fix clipboard
set mouse=a  " fix mouse
set bs=2     " fix backspace

" ==============================================================================================
" use Ctrl-C for copying into the system clipboard
" ==============================================================================================
vnoremap <C-c> "*y

" ==============================================================================================
" NerdTree
" ==============================================================================================
map <C-n> <plug>NERDTreeTabsToggle<CR>
" ==============================================================================================
" Silver Searcher
" ==============================================================================================
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif	

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (back slash_ to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" ===============================================================================================
" You complete me settings
" ===============================================================================================
" g:ycm_extra_conf_globlist = [ '/home/mint64/workspace/diosmaster/.ycm_extra_conf_globlist.py' ]

" ==============================================================================================
" Colorscheme
" ==============================================================================================
set background=dark
set t_Co=256

"colorscheme solarized
"colorscheme butter
colorscheme gruvbox
" colorscheme lucius

" ===============================================================================================
" turn off swap file, coz it's annoying
" ==============================================================================================
set noswapfile
set nobackup
set nowritebackup

" ==============================================================================================
" map ,s to easy motion plugin
" ==============================================================================================
map <Leader> <Plug>(easymotion-prefix)
map <C-f> <Plug>(easymotion-prefix)s


" ==============================================================================================
" map Ctrl-Tab to switch beteen tabs
" ==============================================================================================
" map <C-Tab> gt        " that only works in gvim
" map <C-S-Tab> gT
map <M-h> gT            " Alt-left moves to the previous tab
map <A-l> gt            " Alt-right moves to the next tab
map <C-i> gt            " Tab moves to the next tab

" ==============================================================================================
" map ctrl-movement keys to create/navigate splits
" ==============================================================================================
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
        let t:curwin = winnr()
        exec "wincmd ".a:key
        if(t:curwin == winnr())
                if(match(a:key, '[jk]'))
                        wincmd v
                else
                        wincmd s
                endif
                exec "wincmd ".a:key
        endif
endfunction

map <silent> <S-h> :vertical resize -1<CR>
map <silent> <S-l> :vertical resize +1<CR>
map <silent> <S-k> :resize +1<CR>
map <silent> <S-j> :resize -1<CR>
" ==============================================================================================
" move between tabs with leader n,m
" TODO: move between tabs with Alt+tab or Alt+left/right
" ==============================================================================================
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" ==============================================================================================
" keep selection during indentation (so we can do it multiple times)
" ==============================================================================================
vnoremap < <gv
vnoremap > >gv
 
" ==============================================================================================
" Ctrl-S is a common command to terminals to stop updating, it was a way to slow the output so you could read it on terminals
" that didn't have a scrollback buffer. First find out if you can configure your xterm to pass Ctrl-S through to the application.
" Then these map commands will work:
" ==============================================================================================
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" ==============================================================================================
" wrap paragraphs by pressing Q
" ==============================================================================================
" vmap Q gq
" nmap Q gqap
" figure out how to use it

" ==============================================================================================
" History, Undo
" ==============================================================================================
set history=700
set undolevels=700

" ==============================================================================================
" scroll down before cursor reaches the last line
" ==============================================================================================
set scrolloff=5

" ==============================================================================================
" HTML, XML: use alvan/vim-closetag plugin on the following file types
" ==============================================================================================
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"


" ==============================================================================================
" Reload .vimrc automatically
" ==============================================================================================
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd
