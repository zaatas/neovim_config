-- ╭─────────────────────────────────────────────────────────╮
-- │ Removes search highlight after the curson is moved      │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "romainl/vim-cool",
  lazy = false,
  config = function()
    vim.cmd [[
      set hlsearch
      let g:cool_total_matches = 1
   ]]
  end,
}
