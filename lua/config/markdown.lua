-- ╭─────────────────────────────────────────────────────────╮
-- │ Browser preview                                         │
-- ╰─────────────────────────────────────────────────────────╯
return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    -- build = ":call mkdp#util#install()",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "pandoc.markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
-- ╭─────────────────────────────────────────────────────────╮
-- │ improve viewing Markdown files                          │
-- ╰─────────────────────────────────────────────────────────╯
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup {}
    end,
  },
}
