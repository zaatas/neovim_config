-- ╭─────────────────────────────────────────────────────────╮
-- │ Nvim Terminal Tool                                      │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "ryanmsnyder/toggleterm-manager.nvim",
  dependencies = {
    "akinsho/nvim-toggleterm.lua",
    version = "*",
  },

  config = function()
    require("toggleterm-manager").setup {
      titles = {
        prompt = "Pick Term",
        results = "Terminals",
      },
      -- more overrides if desired
    }

    require("toggleterm").setup {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.2
        end
      end,

      open_mapping = [[<C-\>]],

      -- direction = 'vertical', --  | 'horizontal' ,
      direction = "horizontal",

      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = false,
      persist_mode = false,
      --direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,

      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }

    keymap(
      "n",
      "<C-\\>",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { desc = "Toggleterm direction" }
    )
  end,
}
