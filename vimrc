" https://github.com/conceptacid/dotfiles/blob/master/init.vim
" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let s:darwin = has('mac')
let g:python_host_prog='/usr/bin/python2'
let g:mapleader = "\<Space>"
" ===================================================================
" Autoinstall vim-plug
" ===================================================================
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.nvim/plugged') " Plugins initialization start {{{

if s:darwin
  let g:plug_url_format = 'git@github.com:%s.git'
else
  let $GIT_SSL_NO_VERIFY = 'true'
endif

" ====================================================================
" Appearance
" ====================================================================

" disabled: doesn't work well with incremental search
" auto-clear search on cursor move, impoved star-search
" Plug 'junegunn/vim-slash'

" switch colorschemes with F8
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'


" nice information line at the bottom of the screen
Plug 'itchyny/lightline.vim'

" colorscheme
Plug 'nanotech/jellybeans.vim'
" huge list of colorschemes (many are quite ugly, therefore disabled)
" Plug 'gmist/vim-palette'

Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'yuttie/hydrangea-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-scripts/eclipse.vim'
Plug 'aunsira/macvim-light'
Plug 'junegunn/seoul256.vim'
"{{{
  let g:seoul256_background = 237
"}}}

" Go support
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" visualizations of markers
Plug 'kshenoy/vim-signature'
" {{{
  let g:SignatureMarkerTextHL = 'Typedef'
  let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "m<Space>",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "",
    \ 'GotoPrevLineAlpha'  :  "",
    \ 'GotoNextSpotAlpha'  :  "",
    \ 'GotoPrevSpotAlpha'  :  "",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "]`",
    \ 'GotoPrevSpotByPos'  :  "[`",
    \ 'GotoNextMarker'     :  "[+",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListLocalMarks'     :  "m/",
    \ 'ListLocalMarkers'   :  "m?"
    \ }
" }}}

" automatically adjusts shiftwidth and expandtabs
Plug 'tpope/vim-sleuth'

" distraction-free mode
Plug 'junegunn/goyo.vim'
" {{{
let g:goyo_width = 120
let g:goyo_height = 90
nnoremap zd :Goyo<CR>
" }}}

" paragraph highlight mode
Plug 'junegunn/limelight.vim'
" {{{
  let g:limelight_default_coefficient = 0.7
  let g:limelight_conceal_ctermfg = 238
  nmap <silent> zl :Limelight!!<CR>
  xmap zl <Plug>(Limelight)
" }}}

" Completion
" ====================================================================
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --tern-completer --clang-completer' }
let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<c-j>'
let g:ycm_complete_in_strings = 1
  "
  "
  "
  "
" " configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4
" " build tags of your own project with Ctrl-F12
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"
" " OmniCppComplete
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" " automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview

" File Navigation
" ====================================================================
Plug 'scrooloose/nerdtree'
" {{{
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeHijackNetrw = 0
  let g:NERDTreeWinSize = 31
  let g:NERDTreeChDirMode = 2
  let g:NERDTreeAutoDeleteBuffer = 1
  let g:NERDTreeShowBookmarks = 1
  let g:NERDTreeCascadeOpenSingleChildDir = 1

  map <F1> :call NERDTreeToggleAndFind()<cr>
  map <F2> :NERDTreeToggle<CR>

  function! NERDTreeToggleAndFind()
    if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
      execute ':NERDTreeClose'
    else
      execute ':NERDTreeFind'
    endif
  endfunction
" }}}

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>. :AgIn 
  nnoremap <C-f> :BLines<CR>
  nnoremap <silent> <leader>f :execute 'Ag ' . input('Ag/')<CR>


  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)

" global search and replace plugin
" This plugin is obsolete, use the ag to feed quickfix and then use cdo to
" search/replace in the files, use cdo update to save changes
" Plug 'skwp/greplace.vim'
" set grepprg=ag
" let g:grep_cmd_opts = '--line-numbers --noheading'


" most-recently used files and directories
Plug 'Shougo/neomru.vim'
  let g:neomru#file_mru_path = $HOME . '/.nvim/cache/neomru/file'
  let g:neomru#directory_mru_path = $HOME . '/.nvim/cache/neomru/directory'

" Text Navigation
" ====================================================================
Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_off_screen_search = 0
  nmap ; <Plug>(easymotion-s)
  nmap <leader>; <Plug>(incsearch-easymotion-stay)

" incremental search
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" use f and F to find characters on the current line
Plug 'rhysd/clever-f.vim'
  let g:clever_f_across_no_line = 1

" Text Manipulation
" ====================================================================
" brackets, quotes, etc..
Plug 'tpope/vim-surround'

" table alignments, see the doc
Plug 'junegunn/vim-easy-align'
" let g:easy_align_ignore_comment = 0 " align comments
" vnoremap <silent> <Enter> :EasyAlign<cr>

" comments management
" gcc - toggle comments, but also see the docs for more keybindings 
" https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim'

" delimiters?
Plug 'Raimondi/delimitMate'
" {{{
  let delimitMate_expand_cr = 2
  let delimitMate_expand_space = 1 " {|} => { | }
" }}}

" language-specific switch between single line and multi line operators (e.g.
" if {} else {}
" gS - split to a multiple lines,
" gJ - joins a block to a one-liner
Plug 'AndrewRadev/splitjoin.vim'

" read also the interview with AndrewRadev: http://howivim.com/2016/andrew-radev/
" switches true to false, dots to arrows, etc...
" to activate, use :Switch command
Plug 'AndrewRadev/switch.vim'
" {{{
  let g:switch_mapping = '\'
" }}}

" move the block of code sideways
" todo: replace it with ctrl-arrows
Plug 'AndrewRadev/sideways.vim'
" {{{
  nnoremap <Leader>< :SidewaysLeft<CR>
  nnoremap <Leader>> :SidewaysRight<CR>
" }}}




" CONTINUE FROM HERE
" adds end operators in different languages
Plug 'tpope/vim-endwise'

" create your own text objects - NOT NEEDED
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'


" switch between header and cpp files
Plug 'derekwyatt/vim-fswitch'
nnoremap <leader>gh :FSHere<CR>
 
 
 
" syntax checking for many languages
Plug 'scrooloose/syntastic'
  let g:syntastic_enable_signs          = 1
  let g:syntastic_enable_highlighting   = 1
  let g:syntastic_cpp_check_header      = 1
  let g:syntastic_enable_balloons       = 1
  let g:syntastic_echo_current_error    = 1
  let g:syntastic_check_on_wq           = 0
  let g:syntastic_error_symbol          = '✘'
  let g:syntastic_warning_symbol        = '!'
  let g:syntastic_style_error_symbol    = ':('
  let g:syntastic_style_warning_symbol  = ':('
  let g:syntastic_vim_checkers          = ['vint']
  let g:syntastic_elixir_checkers       = ['elixir']
  let g:syntastic_python_checkers       = ['flake8']
  let g:syntastic_javascript_checkers   = ['eslint']
  let g:syntastic_enable_elixir_checker = 0

  let g:syntastic_ruby_rubocop_exec = '~/.rubocop.sh'
  let g:syntastic_ruby_rubocop_args = '--display-cop-names --rails'

  function! RubocopAutoCorrection()
    echo 'Starting rubocop autocorrection...'
    cexpr system('rubocop -D -R -f emacs -a ' . expand(@%))
    edit
    SyntasticCheck rubocop
    copen
  endfunction

  augroup syntasticCustomCheckers
    autocmd!
    autocmd FileType ruby nnoremap <leader>` :SyntasticCheck rubocop<CR>
    autocmd FileType ruby nnoremap <leader>! :call RubocopAutoCorrection()<CR>
  augroup END


" emmet abbreviations for html, css
Plug 'mattn/emmet-vim'
  let g:user_emmet_expandabbr_key = '<c-e>'

" always highlight enclosing tags
Plug 'Valloric/MatchTagAlways'

" a set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more (formerly allml)
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
 
" must have mappings for working with JSON in Vim:
" -    aj provides a text object for the outermost JSON object, array, string, number, or keyword.
" -    gqaj "pretty prints" (wraps/indents/sorts keys/otherwise cleans up) the JSON construct under the cursor.
" -    gwaj takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
" -    ij variants that target innermost rather than outermost JSON construct.
Plug 'tpope/vim-jdaddy'

" Context filetype library for Vim script 
" Plug 'Shougo/context_filetype.vim'

" omni-complete and syntax checker for html5
Plug 'othree/html5.vim'

" yet another javascript syntax
" Plug 'othree/yajs.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" let g:used_javascript_libs = 'jquery'
" Plug 'gavocanov/vim-js-indent'
" Plug 'ap/vim-css-color'
" vim jsx syntax
" Plug 'mxw/vim-jsx'

" a nicer python indentation style
Plug 'hynek/vim-python-pep8-indent'

" vim octave
Plug 'jvirtanen/vim-octave'

" a modern plugin for editin latex files
" Plug 'lervag/vimtex'
"   let g:vimtex_view_method = 'zathura'
"   augroup latex
"     autocmd!
"     autocmd FileType tex nnoremap <buffer><F5> :VimtexCompile<CR>
"     autocmd FileType tex map <silent> <buffer><F8> :call vimtex#latexmk#errors_open(0)<CR>
"   augroup END


" vim dockerfile syntax
Plug 'ekalinin/Dockerfile.vim'

" automatic keyboard switch
Plug 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'
let g:XkbSwitchNLayout = 'us'
let g:XkbSwitchILayout = 'us'
function! RestoreKeyboardLayout(key)
  call system("xkb-switch -s 'us'")
  execute 'normal! ' . a:key
endfunction
nnoremap <silent> р :call RestoreKeyboardLayout('h')<CR>
nnoremap <silent> о :call RestoreKeyboardLayout('j')<CR>
nnoremap <silent> л :call RestoreKeyboardLayout('k')<CR>
nnoremap <silent> д :call RestoreKeyboardLayout('l')<CR>

" automatically generates tag files for the project
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_exclude = [
    \ '*.min.js',
    \ '*html*',
    \ 'jquery*.js',
    \ '*/vendor/*',
    \ '*/node_modules/*',
    \ '*/python2.7/*',
    \ '*/migrate/*.rb'
    \ ]
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_write = 0
let g:gutentags_generate_on_new = 0
nnoremap <leader>t! :GutentagsUpdate!<CR>


" pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
nnoremap coe :set <C-R>=&expandtab ? 'noexpandtab' : 'expandtab'<CR><CR>

" syntactic sugar for linux commands, e.g. :Locate, :Find, etc..
" https://github.com/tpope/vim-eunuch
Plug 'tpope/vim-eunuch'

" async build and test dispatcher, see make commands
Plug 'tpope/vim-dispatch'

" opens browser search
Plug 'tyru/open-browser.vim'
let g:netrw_nogx = 1
vmap gx <Plug>(openbrowser-smart-search)
nmap gx <Plug>(openbrowser-search)

" create a temp file for memo, testing...
Plug 'Shougo/junkfile.vim'
nnoremap <leader>jo :JunkfileOpen 
let g:junkfile#directory = $HOME . '/.nvim/cache/junkfile'

" displays the register values in floating window on the right
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_delay = 400
let g:peekaboo_window = "vert bo 80new"

" ack grep ??? todo: check why do we need that if we have ag
Plug 'mileszs/ack.vim'

" undo tree
Plug 'mbbill/undotree'
set undofile
" Auto create undodir if not exists
let undodir = expand($HOME . '/.nvim/cache/undodir')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
let &undodir = undodir
nnoremap <leader>U :UndotreeToggle<CR>
call plug#end() " Plugins initialization finished {{{
" }}}

" General settings {{{
" ====================================================================
set clipboard=unnamed,unnamedplus
set number         " show line numbers
set relativenumber " use relative lines numbering by default
set noswapfile     " disable creating of *.swp files
set hidden         " hide buffers instead of closing
set lazyredraw     " speed up on large files
set mouse=         " disable mouse

set scrolloff=10       " always keep cursor at the middle of screen
set virtualedit=onemore " allow the cursor to move just past the end of the line
set undolevels=5000     " set maximum undo levels

" ! save global variables that doesn't contains lowercase letters
" h disable the effect of 'hlsearch' when loading the viminfo
" f1 store marks
" '100 remember 100 previously edited files
set viminfo=!,h,f1,'100

set foldmethod=manual       " use manual folding
set diffopt=filler,vertical " default behavior for diff

" ignore pattern for wildmenu
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp
set wildmode=list:longest,full

" DO NOT ENABLE THESE!!!
"set list " show hidden characters
"set listchars=tab:•·,trail:·,extends:❯,precedes:❮,nbsp:×

set laststatus=2 " always show status line
set showcmd      " always show current command

set nowrap        " disable wrap for long lines
set textwidth=0   " disable auto break long lines
" }}}

" Line numbers
" =====================================================================
" {{{
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap zn :call NumberToggle()<cr>
" }}}


" Indentation {{{
" ====================================================================
set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" }}}
" Search {{{
" ====================================================================
set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on
" }}}
" Colors and highlightings {{{
" ====================================================================
colorscheme seoul256

"colorscheme jellybeans
"let g:lightline#colorscheme#jellybeans_mod#palette = lightline#colorscheme#flatten(s:p)
"colorscheme solarized8_flat


set cursorline     " highlight current line
set colorcolumn=120 " highlight column


" jellybeans stuff
" highlight! ColorColumn ctermbg=233 guibg=#131313
" Various columns
" highlight! SignColumn ctermbg=233 guibg=#0D0D0D
" highlight! FoldColumn ctermbg=233 guibg=#0D0D0D

" Syntastic
" highlight SyntasticErrorSign guifg=black guibg=#E01600 ctermfg=16 ctermbg=160
" highlight SyntasticErrorLine guibg=#0D0D0D ctermbg=232
" highlight SyntasticWarningSign guifg=black guibg=#FFED26 ctermfg=16 ctermbg=11
" highlight SyntasticWargningLine guibg=#171717
" highlight SyntasticStyleWarningSign guifg=black guibg=#bcbcbc ctermfg=16 ctermbg=250
" highlight SyntasticStyleErrorSign guifg=black guibg=#ff8700 ctermfg=16 ctermbg=208

" Highlight the search text with a bright yellow color
" set the color of the highlighted text for searching
hi Search cterm=NONE ctermfg=black ctermbg=yellow 
hi Cursor cterm=NONE ctermfg=black ctermbg=red

" Language-specific
highlight! link elixirAtom rubySymbol
" }}}
" Key Mappings " {{{
nnoremap <leader>vi :tabedit $MYVIMRC<CR>

" toggle last tab
let g:lasttab = 1
nmap <Leader><Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" circular windows navigation
nnoremap <Tab>   <c-W>w
nnoremap <S-Tab> <c-W>W
nnoremap <leader>t :tabnew<CR>
" Toggle quickfix
map <silent> <F8> :copen<CR>



" Y behave like D or C
nnoremap Y y$

" Disable search highlighting
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Copy current file path to clipboard
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
function! CopyCurrentFilePath() " {{{
  let @+ = expand('%')
  echo @+
endfunction
" }}}

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Select all text
noremap vA ggVG

" Same as normal H/L behavior, but preserves scrolloff
nnoremap H :call JumpWithScrollOff('H')<CR>
nnoremap L :call JumpWithScrollOff('L')<CR>
function! JumpWithScrollOff(key) " {{{
  set scrolloff=0
  execute 'normal! ' . a:key
  set scrolloff=999
endfunction " }}}

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" If split in given direction exists - jump, else create new split
function! JumpOrOpenNewSplit(key, cmd, fzf) " {{{
  let current_window = winnr()
  execute 'wincmd' a:key
  if current_window == winnr()
    execute a:cmd
    if a:fzf
      Files
    endif
  else
    if a:fzf
      Files
    endif
  endif
endfunction " }}}

" switch that off, use Alt for text moving
" windows navigation with Alt (works also in terminal mode!)
" :tnoremap <A-h> <C-\><C-n><C-w>h
" :tnoremap <A-j> <C-\><C-n><C-w>j
" :tnoremap <A-k> <C-\><C-n><C-w>k
" :tnoremap <A-l> <C-\><C-n><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l

nnoremap <silent> <Leader>hh :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 0)<CR>
nnoremap <silent> <Leader>ll :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 0)<CR>
nnoremap <silent> <Leader>kk :call JumpOrOpenNewSplit('k', ':leftabove split', 0)<CR>
nnoremap <silent> <Leader>jj :call JumpOrOpenNewSplit('j', ':rightbelow split', 0)<CR>

nnoremap <silent> <C-w>h :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 0)<CR>
nnoremap <silent> <C-w>l :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 0)<CR>
nnoremap <silent> <C-w>k :call JumpOrOpenNewSplit('k', ':leftabove split', 0)<CR>
nnoremap <silent> <C-w>j :call JumpOrOpenNewSplit('j', ':rightbelow split', 0)<CR>

" " Same as above, except it opens unite at the end
" nnoremap <silent> <Leader>h<Space> :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 1)<CR>
" nnoremap <silent> <Leader>l<Space> :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 1)<CR>
" nnoremap <silent> <Leader>k<Space> :call JumpOrOpenNewSplit('k', ':leftabove split', 1)<CR>
" nnoremap <silent> <Leader>j<Space> :call JumpOrOpenNewSplit('j', ':rightbelow split', 1)<CR>

" Remove trailing whitespaces in current buffer
nnoremap <Leader><BS>s :1,$s/[ ]*$//<CR>:nohlsearch<CR>1G

" Universal closing behavior
nnoremap <silent> Q :call CloseSplitOrDeleteBuffer()<CR>
nnoremap <silent> Й :call CloseSplitOrDeleteBuffer()<CR>
function! CloseSplitOrDeleteBuffer() " {{{
  if winnr('$') > 1
    wincmd c
  else
    execute 'bdelete'
  endif
endfunction " }}}

" Delete all hidden buffers
nnoremap <silent> <Leader><BS>b :call DeleteHiddenBuffers()<CR>
function! DeleteHiddenBuffers() " {{{
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction " }}}

let g:session_dir = '$HOME/.nvim/sessions/'
nnoremap <Leader>sl :wall<Bar>execute "source " . g:session_dir . fnamemodify(getcwd(), ':t')<CR>
nnoremap <Leader>ss :execute "mksession! " . g:session_dir . fnamemodify(getcwd(), ':t')<CR>
" }}}
" Terminal {{{
" ====================================================================
nnoremap <silent> <leader><Enter> :tabnew<CR>:terminal<CR>

" Opening splits with terminal in all directions
nnoremap <Leader>h<Enter> :leftabove  vnew<CR>:terminal<CR>
nnoremap <Leader>l<Enter> :rightbelow vnew<CR>:terminal<CR>
nnoremap <Leader>k<Enter> :leftabove  new<CR>:terminal<CR>
nnoremap <Leader>j<Enter> :rightbelow new<CR>:terminal<CR>


" Open tig
nnoremap <Leader>gg :tabnew<CR>:terminal tig<CR>

tnoremap <F1> <C-\><C-n>
tnoremap <C-\><C-\> <C-\><C-n>:bd!<CR>
" exits terminal by pressing esc (this is bad idea because this also works in
" FZF window, thus, after pressing ESC the FZF window is not closed
  tnoremap <Esc> <C-c> 
  " <C-\><C-n>
" tnoremap <C-\><C-\> <C-\><C-n>:bd!<CR>

function! TerminalInSplit(args)
  botright split
  execute 'terminal' a:args
endfunction

nnoremap <leader><F1> :execute 'terminal ranger ' . expand('%:p:h')<CR>
nnoremap <leader><F2> :terminal ranger<CR>
augroup terminalSettings
  autocmd!
  autocmd FileType ruby nnoremap <leader>\ :call TerminalInSplit('pry')<CR>
augroup END
" }}}
" Autocommands {{{
" ====================================================================
augroup vimGeneralCallbacks
  autocmd!
  autocmd BufWritePost .nvimrc nested source ~/.nvimrc
augroup END

augroup fileTypeSpecific
  autocmd!

  " JST support
  autocmd BufNewFile,BufRead *.ejs set filetype=jst
  autocmd BufNewFile,BufRead *.jst set filetype=jst
  autocmd BufNewFile,BufRead *.djs set filetype=jst
  autocmd BufNewFile,BufRead *.hamljs set filetype=jst
  autocmd BufNewFile,BufRead *.ect set filetype=jst

  autocmd BufNewFile,BufRead *.js.erb set filetype=javascript

  " Gnuplot support
  autocmd BufNewFile,BufRead *.plt set filetype=gnuplot

  autocmd FileType jst set syntax=htmldjango
augroup END

augroup quickFixSettings
  autocmd!
  autocmd FileType qf
        \ nnoremap <buffer> <silent> q :close<CR> |
        \ map <buffer> <silent> <F4> :close<CR> |
        \ map <buffer> <silent> <F8> :close<CR>
augroup END

augroup terminalCallbacks
  autocmd!
  autocmd TermClose * call feedkeys('<cr>')
augroup END
"}}}
" Cursor configuration {{{
" ====================================================================
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let &t_SI = "\<Esc>[5 q"
  let &t_SR = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[2 q"
" }}}
" vim: set sw=2 ts=2 et foldlevel=0 foldmethod=marker:
imap jj <Esc>
imap jk <Esc>
imap <A-h> <C-O>h
imap <A-j> <C-O>j
imap <A-k> <C-O>k
imap <A-l> <C-O>l

" Reload the buffer on reload command
command! Reload edit!

" Save files {{{
" ====================================================================
" Save files with Ctrl-s
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>l
vnoremap <c-s> <Esc>:w<CR>
" Quick way to save file
nnoremap <leader>w :w<CR>
" }}}
" next commands are very important - they allow using '?' in Ag to see the
" preview
" command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


vmap <leader>g :s/<C-R><C-W>//
map <leader>g :s/<C-R><C-W>//


function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction


" quickfix commands
function! ToggleList(bufname, pfx)
  let buflist = getbufferlist()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl errormsg
      echo "location list is empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
" toggle quickfix list window
" nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <A-q> :call ToggleList("Quickfix List", 'c')<CR>
" quickfix navigation
:nnoremap <A-n> :cnext<CR>
:nnoremap <A-N> :cprev<CR>


nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
" nmap f <Plug>(incsearch-stay)


" always use n to search forward and N to search backward, regardless of / or
" ?
noremap <expr> n 'Nn'[v:searchforward]
noremap <expr> N 'nN'[v:searchforward]

" utility function: generate a Guid
function! Guid()
python << EOF
import uuid, vim
vim.command("normal i" + str(uuid.uuid4()) )
EOF
endfunction


" jumplist navigation with gn(next, similar to C-o), gp(prev, similar to C-i)
nnoremap <C-i> <C-i>
nnoremap gp <C-o>
nnoremap gn <C-i>


" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

nmap <S-J> Vj
vmap <S-J> j
nmap <S-K> Vk
vmap <S-K> k


" copy to the clipboard
vmap <C-c> "+y
" paste from the clipboard
nmap <C-v> "+p

