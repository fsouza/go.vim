" Vim indent file
" Language:	Go
" Author:	Alecs King <alecsk@gmail.com>
"
" inspired by indent/lua.vim
"
" very simple:
" just indent common cases to avoid manually typing tab or backspace
"
" for better style, please use gofmt after done editing.
"
" since it just simply uses regex matches,
" there might be some mis-indented corner cases.
" 

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetGoIndent()

" To make Vim call GetLuaIndent() when it finds '\s*)', '\s*}', '\s*case', '\s*default'
setlocal indentkeys+=0=),0=},0=case,0=default

setlocal autoindent

" Only define the function once.
if exists("*GetGoIndent")
  finish
endif

function! GetGoIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  " Add a 'shiftwidth' after lines that start a block:
  " 'case', 'default', '{', '('
  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)
  let midx = match(prevline, '^\s*\%(case\>\|default\>\)')
  if midx == -1
    let midx = match(prevline, '[({]\s*$')
  endif
  if midx != -1
    let ind = ind + &shiftwidth
  endif

  " Subtract a 'shiftwidth' on 'case', 'default', '}', ')'.
  " This is the part that requires 'indentkeys'.
  let midx = match(getline(v:lnum), '^\s*\%(case\>\|default\>\|[)}]\)')
  if midx != -1
    let ind = ind - &shiftwidth
  endif

  return ind
endfunction
