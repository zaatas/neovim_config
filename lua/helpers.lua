-- ╭──────────────────────────────────────────────────────────╮
-- │ --  Helper / Util Functions                              │
-- │ --  Thanks to my ancient vimrc several not used          │
-- ╰──────────────────────────────────────────────────────────╯
vim.cmd([[
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function! CreateFile(tfilename)
    " complete filepath from the file where this is called
    " let newfilepath=expand('%:p:h') .'/'. expand(a:tfilename)
    let myfilepath=expand(a:tfilename)
    " echo myfilepath

    " if filereadable(newfilepath)
    if filereadable(myfilepath)
       echo "File already exists"
       :norm gf
    else
        :silent execute "!touch ". expand(myfilepath)
        " :execute "!touch ". expand(newfilepath)
        " echom "File created: ". expand(newfilepath)
        echom "File created: ". expand(myfilepath)
        :norm gf
    endif
endfunction
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
    let &scrolloff = l:scrolloffsave
endfunction
" ---------------------------------------------------------
function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction
" ---------------------------------------------------------
function! SaveDelBuff()
  :update
  :Bwipeout
endfunction
" ---------------------------------------------------------
function! ToggleWinSplit()
  let prev_name = winnr()
  silent! wincmd w
  if prev_name == winnr()
    call SplitNice()
  else
    call SmartClose()
  endif
endfunction
" ---------------------------------------------------------
function! SplitNice()
  if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction
" ---------------------------------------------------------
function! SmartClose()
  if winnr('$') != 1
    close
  endif
endfunction
" ---------------------------------------------------------
function! ScrollOtherWindow(direction)
  execute 'wincmd' (winnr('#') == 0 ? 'w' : 'p')
  execute (a:direction ? "normal! \<C-y>" : "normal! \<C-e>")
  wincmd p
endfunction
" ---------------------------------------------------------
function! NeatFoldText()
  hi Folded term=NONE cterm=NONE gui=NONE

  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1

  let foldSize = 1 + v:foldend - v:foldstart
  let lineCount = line("$")

  if has("float")
     try
       let foldPercentage = printf(" %.1f", (foldSize*1.0)/lineCount*100) . "% "
       catch /^Vim\%((\a\+)\)\=:E806/	" E806: Using Float as String
       let foldPercentage = printf("| [of %d lines] |", lineCount)
     endtry
  endif

  "let lines_count_text = '| ' . printf("%10s", lines_count . ' lines ') . ' - ' . foldPercentage . ' |'
  let lines_count_text = ' '

  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart(' <<->> ' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 40)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend

  endfunction
" ---------------------------------------------------------
function! ToggleNumbering() abort
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction
" ---------------------------------------------------------
function! MyConcealOff()
  set conceallevel=0
endfunction
" ---------------------------------------------------------
function! MyConcealOn()
  set conceallevel=2
endfunction
" ---------------------------------------------------------
function! StripTWSpaces()
  let l:l = line(".")
  let l:c = col(".")
  %s/\s\+$//e
  call cursor(l:l, l:c)
endfunction
" ---------------------------------------------------------
function! MyHelpTab()
  " Help <what you want help with> displayed in a new tab ex: help nmap
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
" ---------------------------------------------------------
function PrintKeymap()
  :!rm ~/.config/nvim/pk_vim_keymap.txt
  :redir > ~/.config/nvim/pk_vim_keymap.txt
  :silent verbose map
        " :silent verbose vmap
        " :silent verbose imap
  :redir END
endfunction
" ---------------------------------------------------------
function! Toggle_Quickfix_Window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
     vert 45copen
     setlocal nowrap
     setlocal whichwrap=b,s
  endif
endfunction
" ---------------------------------------------------------
" nnoremap <silent> q<Space> :<C-u>call Toggle_Quickfix_Window()<CR>
" using fzf-quickfix
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" vim:ft=vim fdm=marker
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
]])
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
