au BufReadPre,BufNewFile *.go set filetype=go fileencoding=utf-8 fileencodings=utf-8

"Set noexpandtab to Go files
autocmd FileType go setlocal noexpandtab

"Mapping gorun
autocmd FileType go map <Leader>g :!gorun %<CR>

"Compiling (using Make)
autocmd FileType go map <F5> :mak<CR>

"Mapping godoc
autocmd FileType go map <F8> :Godoc<CR>
