-- ╭─────────────────────────────────────────────────────────╮
-- │ A neovim plugin leveraging pandoc to help you convert   │
-- │ markdown files.                                         │
-- │ It takes pandoc options from yaml blocks.               │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "jghauser/auto-pandoc.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = "markdown",
  config = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.md",
      callback = function()
        keymap("n", "go", function()
          require("auto-pandoc").run_pandoc()
        end, { silent = true, buffer = 0 })
      end,
      group = vim.api.nvim_create_augroup("setAutoPandocKeymap", {}),
      desc = "Set keymap for auto-pandoc",
    })
  end
}

-- ---
-- pandoc_:
--   - output: .pdf
--   - defaults: academic # this is just an example option, adapt to your preference
-- ---
