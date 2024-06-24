-- ╭─────────────────────────────────────────────────────────╮
-- │ Lightweight yet powerful formatter                      │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    async = true,
    ignore_errors = false,

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "fuff)_fix", "ruff_organize_imports", "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      stylua = {
        prepend_args = {
          "--indent-type=spaces",
          "--indent-width=2",
          "--column-width=100",
        },
      },
      ruff_fmt = {
        prepend_args = {
          "--line-length=120",
          "--target-version=py311",
        },
      },
    },
    log_level = vim.log.levels.ERROR,
    format_on_save = nil,
    format_after_save = nil,
  },

  config = function(_, opts)
    require("conform").setup(opts)
  end,

  keymap("n", "<leader>bf", ":Format<CR>", { desc = "Conform Format" }),

  -- :Format / for entire file or visual range
  vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    print "- Formating -"
    require("conform").format { async = true, lsp_fallback = false, range = range }
  end, { range = true }),
}
