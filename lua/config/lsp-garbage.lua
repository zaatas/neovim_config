-- ╭─────────────────────────────────────────────────────────╮
-- │ Garbage collector that stops inactive LSP clients to    │
-- │ free RAM                                                │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "zeioth/garbage-day.nvim",
  lazy=false,
  dependencies = "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    aggressive_mode = false,
    exclude_lsp_clients = {},
  }
}
