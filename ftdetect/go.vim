au BufRead,BufNewFile *.go set filetype=go

"Set noexpandtab to Go files (which sucks, IMHO)
autocmd FileType go setlocal noexpandtab

"Mapping gorun
autocmd FileType go map <Leader>g :!gorun %<CR>
