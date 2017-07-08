"""""""""""""""""""""""""""""
" @author: YJC (openopentw)
"""""""""""""""""""""""""""""

" Autodo after Open"{{{
" other"{{{
set autochdir				" Automatically change to the current directory
"}}}
"}}}

" View"{{{
" showing BLANKS"{{{
set list							" show tabs and blank
set lcs=tab:\|\ ,nbsp:%,trail:		" 設置tab和空格樣式
highlight LeaderTab guifg=#666666
									" 設定行首tab為灰色
match LeaderTab /^\t/				" 匹配行首tab
"}}}
"}}}

" Hotkeys"{{{
" other"{{{
imap jk <Esc>
				" by the way, it can be typed faster than jj.
"}}}
" FUNCTION keys
nmap <F2> <ESC>:tabe 
" nmap <F3> <ESC>:tabe scp://b04902053@linux9.csie.ntu.edu.tw:22/
nmap <F3> <ESC>:OpenSession 
nmap <F4> <ESC>:set syntax=
" nmap <silent> <F5> :NERDTree<CR>
nmap <F6> <ESC>:vs 
map <F7> :set hls!<BAR>set hls?<CR>
										" to toggle highlight or not on
										" searched words
nmap <silent> <F8> <ESC>:!start explorer.exe %:p:h<CR>
nmap <silent> <F9> <ESC>:!start powershell.exe<CR>

" to move TABS"{{{
nmap g= :tabm +<CR>
nmap g- :tabm -<CR>
"}}}
" TODO: change the 'gJ' hotkey
" to move between / move SPLITs"{{{
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
" to add / remove COMMENTS in VISUAL mode"{{{
" (that is, before typing command to add comments, you should select the words)
" ADD
vmap // :s:^\(\s*\):\1// :<CR>
vmap 33 :s:^\(\s*\):\1# :<CR>
vmap "" :s:^\(\s*\):\1" :<CR>
vmap -- :s:^\(\s*\):\1--:<CR>
vmap /8 :s:^\(\s*\)\(.*\)$:\1/* \2 */:<CR>
vmap h/ :s:^\(\s*\)\(.*\)$:\1<!-- \2 -->:<CR>
" REMOVE
vmap /d :s:^\(\s*\)// :\1:<CR>
vmap 3d :s:^\(\s*\)# :\1:<CR>
vmap "d :s:^\(\s*\)" :\1:<CR>
vmap -d :s:^\(\s*\)--:\1:<CR>
vmap 8d :s:^\(\s*\)\/\* \(.*\) \*\/$:\1\2:<CR>
vmap hd :s:^\(\s*\)<!-- \(.*\) -->$:\1\2:<CR>
"}}}
" to beautify JSON/XML"{{{
com! FormatJSON %!python -m json.tool
com! FormatXML  %!xmllint-1.0.exe "%" --format
													" this command required xmllint-1.0.exe
													" which can be downloaded from here: https://code.google.com/archive/p/xmllint/downloads
"}}}
"}}}
