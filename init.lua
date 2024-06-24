-- ╭────────────────────────────────────────────────────────╮
-- │  Author            : Matthew Rockwell                  │
-- │  Inspired by       : VIM Community                     │
-- │  Initially created : 6/14/2024                         │
-- │                                                        │
-- │ ****************************************************** │
-- │  Notes:                                                │
-- │  - Can I replicate my emacs experience ?               │
-- │  - Helped by Git and Rockpy                            │
-- │  - Helped by my ancient turn of the century vim config │
-- ╰────────────────────────────────────────────────────────╯

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require "globals"
require "options"
require "helpers"

keymap("n", "<Space>", "", { desc = "Nullout space before mapping it to <Leader>" })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  --  { import = "plugins" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Theme and UI Things                                     │
  -- ╰─────────────────────────────────────────────────────────╯
  { import = "config/windows" },
  { import = "config/devicons" },
  { import = "config/lualine" },
  { import = "config/vim-cool" },
  { import = "config/dressing" },
  { import = "config/autopairs" },
  { import = "config/indent-scope" },
  { import = "config/log-highlight" },
  { import = "config/vim-illuminate" },
  { import = "config/highlight-args" },
  { import = "config/nvim-colorizer" },
  { import = "config/nvim-solarized" },
  { import = "config/windows-separators" },
  { import = "config/rainbow-delimiters" },
  { import = "config/vim-better-whitespace" },
  { import = "config/vim-better-whitespace" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Writing                                                 │
  -- ╰─────────────────────────────────────────────────────────╯
  { import = "config/pencil" },
  { import = "config/markdown" },
  { import = "config/auto-pandoc" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Files & Buffers                                         │
  -- ╰─────────────────────────────────────────────────────────╯
  { import = "config/conform" },
  { import = "config/comment" },
  { import = "config/neo-clip" },
  { import = "config/sessions" },
  { import = "config/sessions" },
  { import = "config/neoscroll" },
  { import = "config/nvim-tree" },
  { import = "config/telescope" },
  { import = "config/better-esc" },
  { import = "config/nvim-bufdel" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Terminal & Utils                                        │
  -- ╰─────────────────────────────────────────────────────────╯
  { import = "config/notify" },
  { import = "config/project" },
  { import = "config/lazygit" },
  { import = "config/treesitter" },
  { import = "config/toggleterm" },
  { import = "config/hop-search" },
  { import = "config/venv-selector" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Completion and LSP & Dap                                │
  -- ╰─────────────────────────────────────────────────────────╯
  { import = "config/nvim-cmp" },
  { import = "config/nvim-dap" },
  { import = "config/lspconfig" },
  { import = "config/lsp-fidget" },
  { import = "config/lsp-garbage" },

  -- -----------------------------------------------------------
}, {
  -- Options
  defaults = {
    lazy = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "solarized" },
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrePlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
})

require "helpers"
require "keymaps"

-- -------------------------------------------------------------------
-- End init.lua
-- -------------------------------------------------------------------
