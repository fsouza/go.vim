au BufEnter *.go set filetype=go
au BufEnter *.tmpl set filetype=gotmpl

"Set noexpandtab to Go files
autocmd FileType go setlocal noexpandtab
autocmd FileType gotmpl setlocal noexpandtab
