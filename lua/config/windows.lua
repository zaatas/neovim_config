-- ╭─────────────────────────────────────────────────────────╮
-- │ Automatically expand width of the current window.       │
-- │ Maximizes and restore it.                               │
-- ╰─────────────────────────────────────────────────────────╯
return {
  {
    "anuvyklack/middleclass", -- Lua oop library
  },
  {
    "anuvyklack/windows.nvim",
    dependancies = {
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup()

      local function cmd(command)
        return table.concat { "<Cmd>", command, "<CR>" }
      end

      vim.keymap.set("n", "<C-w>z", cmd "WindowsMaximize")
      vim.keymap.set("n", "<C-w>_", cmd "WindowsMaximizeVertically")
      vim.keymap.set("n", "<C-w>|", cmd "WindowsMaximizeHorizontally")
      vim.keymap.set("n", "<C-w>=", cmd "WindowsEqualize")
      vim.keymap.set("n", "<C-w>t", cmd "WindowsToggleAutowidth")
    end,
  },
}
