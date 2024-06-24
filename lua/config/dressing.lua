-- ╭─────────────────────────────────────────────────────────╮
-- │ Improve the default vim.ui interfaces                   │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup {
      input = {
        min_width = { 60, 0.9 },
      },
      select = {
        select = {
          -- telescope = require('telescope.themes').get_ivy({...})
          -- telescope = require("telescope.themes").get_cursor({ initial_mode = "normal" }),
          --
          telescope = require("telescope.themes").get_ivy {
            -- layout_config = { height = 15, width = 90 },
            layout_config = { height = 15 },
          },
        },
      },
      disable = false,
    }
  end,
}
