-- ╭─────────────────────────────────────────────────────────╮
-- │ A Neovim plugin to improve buffer deletion              │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "ojroques/nvim-bufdel",
  config = function()
    require("bufdel").setup {
      next = "tabs",
      quit = false, -- quit Neovim when last buffer is closed
      -- }
      keymap("n", "<leader>x", "<cmd>BufDel<CR>", { desc = "Delete Currect Buffer" }),

      keymap("n", "<leader>X", "<cmd>BufDel!<CR>", { desc = "Delete Currect Buffer (Force No Save)" }),

      keymap("ca", "bx", "<cmd>BufDel<CR>", { desc = "Delete Currect Buffer" }),

      keymap("ca", "bX", "<cmd>BufDel!<CR>", { desc = "Delete Currect Buffer" })
    }
  end
}
