-- ╭─────────────────────────────────────────────────────────╮
-- │ Comments in a Box                                       │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "LudoPinelli/comment-box.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
  config = function()
    require('Comment').setup()

    require('comment-box').setup({

      -- left aligned fixed size box with left aligned text
      keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBllbox<CR>", { desc = "Comment Box Left" }),

      -- centered adapted box
      keymap({ "n", "v" }, "<Leader>cc", "<Cmd>CBacbox<CR>", { desc = "Comment Box Center" }),

      -- remove a box or a titled line
      keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", { desc = "Remove Commnet Box" })

    })
  end
}
