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

" convert tabs into spaces
set expandtab

" one tab= 2 spaces
set tabstop=2

" highlight search text
set hlsearch

" enable incremental search
set incsearch
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

set noswapfile
map <Leader> <Plug>(easymotion-prefix)
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
