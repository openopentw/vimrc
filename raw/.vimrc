" Fix using vim to open scp file
" let g:netrw_cygwin = 0
" let g:netrw_ssh_cmd  = '"C:\Program Files\PuTTY\plink.exe" -batch -T -ssh'
" let g:netrw_scp_cmd  = '"C:\Program Files\PuTTY\pscp.exe"  -batch -q -scp'
" let g:netrw_sftp_cmd = '"C:\Program Files\PuTTY\pscp.exe"  -batch -q -sftp'
" let g:netrw_ssh_cmd  = '"plink.exe" -batch -T -ssh'
" let g:netrw_scp_cmd  = '"pscp.exe"  -batch -q -scp'
" let g:netrw_sftp_cmd = '"pscp.exe"  -batch -q -sftp'


" to beautify json/xml file
com! FormatJSON %!python -m json.tool
" this command required xmllint-1.0.exe which can be downloaded from here: https://code.google.com/archive/p/xmllint/downloads
com! FormatXML  %!xmllint-1.0.exe "%" --format

" Automatically change to the current directory
set autochdir

" show tabs and blank
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/

" hide the backup file (like .*~ file) in Windows
" TODO: this doesn't work ...
" autocmd BufWritePost,FileWritePost * silent ! attrib +h <afile>~

" set syntax
nmap <F4> :set syntax=

" move tabs
nmap g= :tabm +<CR>
nmap g- :tabm -<CR>

" vs & sp hot key
nmap gt <C-w><C-w>
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>
nmap <silent> gK :wincmd K<CR>
nmap <silent> gJ :wincmd J<CR>
nmap <silent> gH :wincmd H<CR>
nmap <silent> gL :wincmd L<CR>

" add comments in visual mode (that is, before typing comments, you should select the words)
vmap // :s:^\(\s*\):\1// :<CR>
vmap 33 :s:^\(\s*\):\1# :<CR>
vmap "" :s:^\(\s*\):\1" :<CR>
vmap -- :s:^\(\s*\):\1--:<CR>
vmap /8 :s:^\(\s*\)\(.*\)$:\1/* \2 */:<CR>
vmap h/ :s:^\(\s*\)\(.*\)$:\1<!-- \2 -->:<CR>

vmap /d :s:^\(\s*\)// :\1:<CR>
vmap 3d :s:^\(\s*\)# :\1:<CR>
vmap "d :s:^\(\s*\)" :\1:<CR>
vmap -d :s:^\(\s*\)--:\1:<CR>
vmap 8d :s:^\(\s*\)\/\* \(.*\) \*\/$:\1\2:<CR>
vmap hd :s:^\(\s*\)<!-- \(.*\) -->$:\1\2:<CR>

" Can be typed even faster than jj.
imap jk <Esc>
imap Jk <Esc>
imap jK <Esc>
imap JK <Esc>

nmap <F2> <ESC>:tabe 
nmap <F3> <ESC>:tabe scp://b04902053@linux9.csie.ntu.edu.tw:22/~/
" nmap <F3> <ESC>:OpenSession 
nmap <F6> <ESC>:vs 
nmap <F8> <ESC>:!start explorer.exe %:p:h<CR>
nmap <F9> <ESC>:!start powershell.exe<CR>

" ColorSchemes"{{{
set background=light
" set background=dark
syntax on

" autocmd BufNewFile,BufReadPost *.php set filetype=php
" autocmd BufNewFile,BufReadPost *.php set syntax=php
" autocmd BufNewFile,BufReadPost *.css set filetype=css
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

colorscheme lucius
LuciusWhite
" LuciusDark
" LuciusDarkLowContrast
" LuciusBlackLowContrast
" LuciusWhiteLowContrast
" LuciusLight
" LuciusLightLowContrast
let g:lucius_use_bold = 1

" colorscheme github		" this one is good too!!
" colorscheme notepad-plus-plus		" the background is strange
" highlight CursorLine ctermbg=189"}}}

" Vundle"{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo

Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plugin 'vim-airline/vim-airline-themes'
" let g:airline_theme='lucius'
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

Plugin 'scrooloose/nerdtree'
nnoremap <silent> <F5> :NERDTree<CR>

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1				" Add spaces after comment delimiters by default
" let g:NERDCompactSexyComs = 1			" Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1			" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1	" Enable trimming of trailing whitespace when uncommenting

" Plugin 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>

" Boshiamy
Plugin 'pi314/boshiamy.vim'

Plugin 'captbaritone/better-indent-support-for-php-with-html'

Plugin 'tpope/vim-surround'

Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plugin 'danro/rename.vim'

" Session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
" autocmd FileType javascript	noremap <buffer> <c-f> :call JsBeautify()<cr>
" autocmd FileType json		noremap <buffer> <c-f> :call JsonBeautify()<cr>
" autocmd FileType jsx		noremap <buffer> <c-f> :call JsxBeautify()<cr>
" autocmd FileType html		noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css		noremap <buffer> <c-f> :call CSSBeautify()<cr>

" git
Plugin 'airblade/vim-gitgutter'

" markdown
" Plugin 'isnowfy/python-vim-instant-markdown'
" Plugin 'iamcco/markdown-preview.vim'
" Plugin 'suan/vim-instant-markdown'

" JSON
Plugin 'elzr/vim-json'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Error Checking
" Plugin 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has('gui_running')
	Plugin 'rdnetto/YCM-Generator'

	Plugin 'Valloric/YouCompleteMe'
	" let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'
	let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/.ycm_extra_conf.py'
	" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
	" let g:ycm_global_ycm_extra_conf = '/nfs/undergrad/04/b04902053/.ycm_extra_conf.py'

	" Plugin 'powerline/powerline'
endif

Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


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
"}}}

" High light unwanted spaces in end of line"{{{
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif"}}}

" highlight link potionOperator Operator"{{{
au BufRead,BufNewFile * syn match Braces display '[{}()\[\]]'
au BufRead,BufNewFile * syn match biOperator "<"
au BufRead,BufNewFile * syn match biOperator ">"
au BufRead,BufNewFile * syn match biOperator "<="
au BufRead,BufNewFile * syn match biOperator ">="
au BufRead,BufNewFile * syn match biOperator "=="
au BufRead,BufNewFile * syn match biOperator "\v\~\="
au BufRead,BufNewFile * syn match biOperator "=""}}}

set laststatus=2
set shiftwidth=4
set tabstop=4
set nu			" show the line number
" set relativenumber			" show the line number
set cursorline	" show the same line
set nowrap		" don't wrap
" 按F7鍵，就會切換有/無高亮度 "
map <F7> :set hls!<BAR>set hls?<CR>
nmap <C-b>n :bnext<CR>
nmap <C-b>p :bprev<CR>

" If no screen, use color term
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif

if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif

set nocompatible
" change here
" set backspace=2
set wildmenu
set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup		" keep a backup file
" set textwidth=78
" set shiftwidth=4
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch

" set background=dark	" another is 'light'

" VIM 6.0,
if version >= 600
    set nohlsearch
    set foldmethod=marker
    set foldmethod=indent
    set foldlevel=1
	set foldcolumn=1
    set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
    set fileencoding=taiwan
endif

" Tab key binding
if version >= 700
  map  <C-s> :w<CR>
  imap <C-s> <ESC>:w<CR>
  map  <C-d> :tabnew<CR>
  imap <C-d> <ESC>:tabnew<CR>
  " map  <C-k> :tabclose<CR>
  " map  <C-x> :tabclose<CR>
"   map  <C-p> :tabprev<CR>
"   imap <C-p> <ESC>:tabprev<CR>
"   map  <C-n> :tabnext<CR>
"   imap <C-n> <ESC>:tabnext<CR>

  map g1 :tabn 1<CR>
  map g2 :tabn 2<CR>
  map g3 :tabn 3<CR>
  map g4 :tabn 4<CR>
  map g5 :tabn 5<CR>
  map g6 :tabn 6<CR>
  map g7 :tabn 7<CR>
  map g8 :tabn 8<CR>
  map g9 :tabn 9<CR>
  map g0 :tabn 10<CR>
  map gc :tabnew
  map gn :tabn<CR>
  map gp :tabp<CR>

  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill


end

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes


if has('gui_running')

  " Let Gvim Control 輸入法
  set imactivatekey=C-space
  inoremap <ESC> <ESC>:set iminsert=0<CR>

  " Set Language
  let $LANG="zh_TW.UTF-8"
  set langmenu=zh_tw.utf-8
  set encoding=utf8

  "reload menu with UTF-8 encoding
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  " Hide Menu
  set go-=m
  set go-=T
  " set go-=r
  " set go-=L
  " nnoremap	<C-1>	:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  " nnoremap	<C-2>	:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
  " nnoremap	<C-3>	:if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

  set t_Co=256
  set guifont=Powerline\ Consolas:h12
  let g:airline_powerline_fonts = 1

  " python from powerline.vim import setup as powerline_setup
  " python powerline_setup()
  " python del powerline_setup
endif
