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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'VAlloric/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
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

" syntax highlighting
filetype off "????
filetype plugin indent on
syntax on


set clipboard=unnamed  " fix clipboard
set mouse=a  " fix mouse
set bs=2     " fix backspace
" KEY mappings
map <C-n> :NERDTreeToggle<CR>
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
" g:ycm_extra_conf_globlist = [ '/home/mint64/workspace/diosmaster/.ycm_extra_conf_globlist.py' ]
set background=light
set t_Co=256

"colorscheme solarized
"colorscheme butter
"colorscheme gruvbox
colorscheme lucius

" turn off swap file, coz it's annoying
set noswapfile
set nobackup
set nowritebackup

" map ,s to easy motion plugin
map <Leader> <Plug>(easymotion-prefix)

" map ctrl-movement keys to create/navigate splits
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

" TODO: resize panes with Ctr+Shift+hjkl
" TODO: enable mouse + right-click + copy
" TODO: need an auto-save plugin
" TODO: find definitions that are not invluded and suggest to add includes (like Alt+Enter) in CLion
" TODO: add a shortcut to open the current file in NerdTree (or go through files of open panes back and forth)
" TODO: missing feature: namespace aware intellisense


" move between tabs with leader n,m
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" keep selection during indentation (so we can do it multiple times)
vnoremap < <gv
vnoremap > >gv
 
" Ctrl-S is a common command to terminals to stop updating, it was a way to slow the output so you could read it on terminals
" that didn't have a scrollback buffer. First find out if you can configure your xterm to pass Ctrl-S through to the application.
" Then these map commands will work:

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>


" wrap paragraphs by pressing Q
vmap Q gq
nmap Q gqap


set history=700
set undolevels=700
