" Copyright 2013 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

if exists("b:did_ftplugin_go_lint")
	finish
endif

if !executable("golint")
	finish
endif

function! s:GoLint()
	cexpr system("golint " . shellescape(expand('%')))
	copen
endfunction

command! -buffer Lint :call s:GoLint()

let b:did_ftplugin_go_lint = 1
