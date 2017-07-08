au BufRead,BufNewFile *.php set filetype=php	" to overrule an existing filetype
au BufRead,BufNewFile *.php setfiletype php		" to set it only if no filetype has been detected for this extension
