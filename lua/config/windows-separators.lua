-- ╭─────────────────────────────────────────────────────────╮
-- │ Make your nvim window separators colorful               │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinNew" },
  config = function()
    require("colorful-winsep").setup {

      hi = {
        bg = "#002B36",
        fg = "#4F5B00",
      },
      symbols = { "─", "│", "┌", "┐", "└", "┘" },
      no_exec_files = { "TelescopePrompt", "mason" },
    }
  end,
}
