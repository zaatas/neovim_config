-- ╭─────────────────────────────────────────────────────────╮
-- │ Allows selection of python virtual environment          │
-- ╰─────────────────────────────────────────────────────────╯
return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap-python'
  },
  lazy = false,
  config = function()
    require('venv-selector').setup {
      parents = 3,
      name = { "venv", ".venv" },
      auto_refresh = false,
    }
  end,
  -- event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  },


}




-- return {
--   "linux-cultist/venv-selector.nvim",
--   dependencies = {
--     "neovim/nvim-lspconfig",
--     "mfussenegger/nvim-dap",
--     "mfussenegger/nvim-dap-python", --optional
--     -- {
--     --   "nvim-telescope/telescope.nvim",
--     --   branch = "0.1.x",
--     --   dependencies = { "nvim-lua/plenary.nvim" },
--     -- },
--   },
--   opts={
--     auto_refresh = true,
--     name = {"venv", ".venv"}
--
--
--   },
--   lazy = false,
--   branch = "regexp", -- This is the regexp branch, use this for the new version
--   config = function()
--     require("venv-selector").setup()
--   end,
--   keys = {
--     { ",v", "<cmd>VenvSelect<cr>" },
--   },
-- }
