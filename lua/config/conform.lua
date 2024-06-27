-- ╭─────────────────────────────────────────────────────────╮
-- │ Lightweight yet powerful formatter                      │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "stevearc/conform.nvim",
  -- cmd = { "ConformInfo" },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local cutil = require "conform.util"

    require("conform").setup {

      async = true,
      ignore_errors = false,

      formatters_by_ft = {
        lua = { "stylua" },
        python = {
          "ruff_fix",
          "ruff_format",
          -- "ruff_organize_imports",
        },
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
            "--line-length=100",
            "--target-version=py311",
          },

          -- stdin = true,
          -- cwd = cutil.root_file {
          --   ".ruff.toml",
          -- },
        },
        ruff_organize_imports = {
          command = "ruff",
          args = {
            args = {
              "check",
              "--force-exclude",
              "--select=I001",
              "--fix",
              "--exit-zero",
              "--stdin-filename",
              "$FILENAME",
              "-",
            },
            stdin = true,
            cwd = cutil.root_file {
              ".ruff.toml",
              "pyproject.toml",
              "ruff.toml",
            },
          },
        },
      },
      log_level = vim.log.levels.ERROR,
      format_on_save = nil,
      format_after_save = nil,
    }

    keymap("n", "<leader>bf", ":Format<CR>", { desc = "Conform Format" })

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
      require("conform").format { async = true, lsp_fallback = true, range = range }
    end, { range = true })
  end,
}
