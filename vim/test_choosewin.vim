function Win_all()
  let l:nerdwindow = win_getid()
  let scope = range(1, winnr('$'))
  for index in scope
     echo index
  endfor
  return scope
endfunction
