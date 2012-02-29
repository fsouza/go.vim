au BufEnter *.go set filetype=go fileencoding=utf-8 fileencodings=utf-8

"Set noexpandtab to Go files
autocmd FileType go setlocal noexpandtab

"Mapping godoc
autocmd FileType go map <F8> :Godoc<CR>
