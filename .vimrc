" vim: set foldmethod=marker:

"""""""""""""""""""""""""""""""""""""""""""""""""""
" author: YJC (openopentw)
" description: my default vimrc setting on ubuntu
"""""""""""""""""""""""""""""""""""""""""""""""""""

" General Settings"{{{
" If no screen, use color term{{{
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif
"}}}
" Load Default Vim Settings{{{
if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif
"}}}
" Default Settings"{{{
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
" set viminfo='20,\"50	" read/write a .viminfo file, don't store more
"}}}
" Special Settings"{{{
set modeline
set autochdir	" Automatically change to the current directory

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes
"}}}
" Backup Dirs"{{{
set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup		" keep a backup file
"}}}
" Dont know how to use"{{{
" set showmatch
"}}}
"}}}

" View"{{{
" General Settings"{{{
set laststatus=2
set nu	" show line number
set nowrap	" don't wrap
set cursorline	" show the same line
set wildmenu

set shiftwidth=4	"TODO: check if 8 is better than 4
set tabstop=4
set nohlsearch
set incsearch
"}}}
" ColorSchemes"{{{
" NOTE: default is white now
" set background=light
" set background=dark

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
" highlight CursorLine ctermbg=189
"}}}
" TabLine"{{{
highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
highlight TabLine    term=bold cterm=bold
highlight clear TabLineFill
"}}}
" Syntax"{{{
syntax on

" autocmd BufNewFile,BufReadPost *.php set filetype=php
" autocmd BufNewFile,BufReadPost *.php set syntax=php
" autocmd BufNewFile,BufReadPost *.css set filetype=css
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"}}}
" showing BLANKS"{{{
" TODO: this is broken
" set list	" show tabs and blank
" set lcs=tab:\|\ ,nbsp:%,trail:		" 設置tab和空格樣式
" highlight LeaderTab guifg=#666666
" 	" 設定行首tab為灰色
" match LeaderTab /^\t/				" 匹配行首tab
"}}}
" Highlight unwanted spaces in end of line"{{{
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
"}}}

" Hotkeys"{{{
" ESC"{{{
imap jk <Esc>
imap Jk <Esc>
imap jK <Esc>
imap JK <Esc>
				" by the way, it can be typed faster than jj.
"}}}
" FX keys"{{{
nmap <F2> <ESC>:tabe 
nmap <F3> <ESC>:tabe scp://b04902053@linux9.csie.ntu.edu.tw:22/
" nmap <F3> <ESC>:OpenSession 
nmap <F4> <ESC>:set syntax=
" nmap <silent> <F5> :NERDTree<CR>	"NOTE: this is defined in /Plugin/Tool
nmap <F6> <ESC>:vs 
" map <F7> :set hls!<BAR>set hls?<CR>
	" to toggle highlight or not on searched words
" nmap <silent> <F8> <ESC>:!start explorer.exe %:p:h<CR>
" nmap <silent> <F9> <ESC>:!start powershell.exe<CR>
"}}}
" about TABs"{{{
nmap g1 :tabn 1<CR>
nmap g2 :tabn 2<CR>
nmap g3 :tabn 3<CR>
nmap g4 :tabn 4<CR>
nmap g5 :tabn 5<CR>
nmap g6 :tabn 6<CR>
nmap g7 :tabn 7<CR>
nmap g8 :tabn 8<CR>
nmap g9 :tabn 9<CR>
nmap g0 :tabn 10<CR>

" nmap gc :tabnew<CR>
nmap gn :tabn<CR>
nmap gp :tabp<CR>
nmap g= :tabm +<CR>
nmap g- :tabm -<CR>
"}}}
" TODO: change the 'gJ' hotkey
" move between / move SPLITs"{{{
nmap gt <C-w><C-w>
" move between
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>
" move
nmap <silent> gK :wincmd K<CR>
nmap <silent> gJ :wincmd J<CR>
nmap <silent> gH :wincmd H<CR>
nmap <silent> gL :wincmd L<CR>
"}}}
" add / remove COMMENTS in VISUAL mode"{{{
" NOTE: use 'tpope/vim-commentary' instead
" " (that is, before typing command to add comments, you should select the words)
" " ADD
" vmap // :s:^\(\s*\):\1// :<CR>
" vmap 33 :s:^\(\s*\):\1# :<CR>
" vmap "" :s:^\(\s*\):\1" :<CR>
" vmap -- :s:^\(\s*\):\1--:<CR>
" vmap /8 :s:^\(\s*\)\(.*\)$:\1/* \2 */:<CR>
" vmap h/ :s:^\(\s*\)\(.*\)$:\1<!-- \2 -->:<CR>
" " REMOVE
" vmap /d :s:^\(\s*\)// :\1:<CR>
" vmap 3d :s:^\(\s*\)# :\1:<CR>
" vmap "d :s:^\(\s*\)" :\1:<CR>
" vmap -d :s:^\(\s*\)--:\1:<CR>
" vmap 8d :s:^\(\s*\)\/\* \(.*\) \*\/$:\1\2:<CR>
" vmap hd :s:^\(\s*\)<!-- \(.*\) -->$:\1\2:<CR>
"}}}
" beautify JSON / XML"{{{
com! FormatJSON %!python -m json.tool
com! FormatXML  %!xmllint-1.0.exe "%" --format
	" this command required xmllint-1.0.exe
	" which can be downloaded from here: https://code.google.com/archive/p/xmllint/downloads
"}}}
"}}}

" Plugin Manager (vim-plug)"{{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" View"{{{
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='sol'
let g:airline_theme='silver'
" let g:airline_theme='lucius'
" let g:airline_powerline_fonts = 1

" Plug 'altercation/vim-colors-solarized'

" TODO: check if it is useful
" Plug 'captbaritone/better-indent-support-for-php-with-html'

" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/seoul256.vim'
"}}}
" Tools "{{{
Plug 'scrooloose/nerdtree'
nnoremap <silent> <F5> :NERDTree<CR>

Plug 'tpope/vim-commentary'

" Plug 'pi314/boshiamy.vim'

" add quotes outside a word, e.g.:  Hello world!  ->  <q>Hello world!</q>
" Plug 'tpope/vim-surround'
"
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" :rename[!] {newname}
Plug 'danro/rename.vim'

" Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_autosave='no'

" JavaScript Beautifyer
" Plugin 'pangloss/vim-javascript'
" Plugin 'maksimr/vim-jsbeautify'
" " autocmd FileType javascript	noremap <buffer> <c-f> :call JsBeautify()<cr>
" " autocmd FileType json		noremap <buffer> <c-f> :call JsonBeautify()<cr>
" " autocmd FileType jsx		noremap <buffer> <c-f> :call JsxBeautify()<cr>
" " autocmd FileType html		noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" " autocmd FileType css		noremap <buffer> <c-f> :call CSSBeautify()<cr>

" git
Plug 'airblade/vim-gitgutter'

" JSON
Plug 'elzr/vim-json'

" YCM
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"}}}
" markdown"{{{
" Plugin 'isnowfy/python-vim-instant-markdown'
" Plugin 'iamcco/markdown-preview.vim'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
"}}}
" Initialize plugin system
call plug#end()
"}}}

if has('gui_running') "{{{
  " Hide Menu"{{{
  set guioptions-=m	" menu bar
  set guioptions-=T	" icons bar
  " set guioptions-=r	" right bar
  " set guioptions-=L	" left bar
  " nnoremap	<C-1>	:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  " nnoremap	<C-2>	:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
  " nnoremap	<C-3>	:if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
  "}}}
  " Toggle Menu Bar"{{{
  nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
  nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
  "}}}
  " gVim font"{{{
  set guifont=Ubuntu\ Mono\ 13
  " let g:airline_powerline_fonts = 1
  "}}}
endif
"}}}
