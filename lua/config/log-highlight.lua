-- ╭─────────────────────────────────────────────────────────╮
-- │ Syntax Highlighting for log files                       │
-- ╰─────────────────────────────────────────────────────────╯
return {
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup {}

      vim.cmd [[
         autocmd BufNewFile,BufRead  /var/log/*  set filetype=log
      ]]
    end,
  },
}
