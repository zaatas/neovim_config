-- ╭─────────────────────────────────────────────────────────╮
-- │ Git in the terminal                                     │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>LG", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  },
  config = function()
    vim.g.lazygit_use_neovim_remote = 0
  end
}
