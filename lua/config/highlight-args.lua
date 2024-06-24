-- ╭─────────────────────────────────────────────────────────╮
-- │ Highlight arguments' definitions and usages, using      │
-- │ Treesitter                                              │
-- ╰─────────────────────────────────────────────────────────╯
-- Need to play with this plugin
return {
  "m-demare/hlargs.nvim",
  config = function()
    require("hlargs").setup()
  end,
}
