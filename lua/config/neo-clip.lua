-- ╭─────────────────────────────────────────────────────────╮
-- │ Clipboard manager                                       │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "kkharji/sqlite.lua", module = "sqlite" },
    -- you'll need at least one of these
    -- {'nvim-telescope/telescope.nvim'},
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require("neoclip").setup()

    keymap("n", "<leader>c", "<cmd>Telescope neoclip<CR>", { desc = "Neoclip" })
  end,
}
