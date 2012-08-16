" Copyright 2011 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.
"
" This file provides a utility function that performs auto-completion of
" package names, for use by other commands.

let s:goos = $GOOS
let s:goarch = $GOARCH

if len(s:goos) == 0
  if exists('g:golang_goos')
    let s:goos = g:golang_goos
  elseif has('win32') || has('win64')
    let s:goos = 'windows'
  elseif has('macunix')
    let s:goos = 'darwin'
  else
    let s:goos = '*'
  endif
endif

if len(s:goarch) == 0
  if exists('g:golang_goarch')
    let s:goarch = g:golang_goarch
  else
    let s:goarch = '*'
  endif
endif

function! go#complete#Package(ArgLead, CmdLine, CursorPos)
  let dirs = []

  let workspaces = split( $GOPATH, ':' )
  if workspaces != []
      let dirs += workspaces
  endif

  let goroot = $GOROOT
  if len(goroot) != 0
    let dirs += [ goroot ]
  endif

  if len( dirs ) == 0
      " should not happen
      return []
  endif

  let ret = {}
  for dir in dirs
    let root = expand(dir.'/pkg/'.s:goos.'_'.s:goarch)
    for i in split(globpath(root, a:ArgLead.'*'), "\n")
      if isdirectory(i)
        let i .= '/'
      elseif i !~ '\.a$'
        continue
      endif
      let i = substitute(substitute(i[len(root)+1:], '[\\]', '/', 'g'), '\.a$', '', 'g')
      let ret[i] = i
    endfor
  endfor
  return sort(keys(ret))
endfunction
