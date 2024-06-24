-- ╭─────────────────────────────────────────────────────────╮
-- │ Enhance writing with better defaults                    │
-- ╰─────────────────────────────────────────────────────────╯
return {
  {
    "reedes/vim-pencil",
    config = function()
      vim.cmd [[

        let g:pencil#autoformat = 1      " 0=manual, 1=auto
        let g:pencil#wrapModeDefault = 'soft'   " or 'hard'
        let g:pencil#textwidth = 78
        let g:pencil#joinspaces = 1     " 0=one_space, 1=two_spaces

        let g:pencil#cursorwrap = 1     " 0=disable, 1=enable

        augroup pencil
            autocmd!
            autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1})
            autocmd FileType textile call pencil#init()
            autocmd FileType text call pencil#init({'wrap': 'soft'})
        augroup END


      ]]
    end,
  },
}
