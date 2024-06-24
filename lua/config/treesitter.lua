-- ╭─────────────────────────────────────────────────────────╮
-- │ ASP Parcer of the Century                               │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
  },
  config = function()
    require("nvim-treesitter.configs").setup {

      auto_install = true,
      ensure_installed = {
        "lua",
        "json",
        "javascript",
        "yaml",
        "css",
        "html",
        "markdown",
        "markdown_inline",
        "vim",
        "bash",
        "python",
        "gitignore",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = { enable = true },
      autopairs = { enable = true },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, languages to disable
        extended_mode = true, -- Also highlight non-bracket delimiters
        max_file_lines = nil,
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
        },
      },
    }
  end,

  -- still testing this folding stuff
  vim.treesitter.query.set(
    "python",
    "folds",
    [[
        (function_definition (block) @fold)
        (class_definition (block) @fold)
      ]]
  ),
}
