-- ╭─────────────────────────────────────────────────────────╮
-- │ Config the LSPs                                         │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    --  do I need this
    -- 'jay-babu/mason-null-ls.nvim',
    -- 'nvimtools/none-ls.nvim',
  },

  config = function()
    local lspconfig = require "lspconfig"
    local lsputil = lspconfig.util

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ config mason plugins                                    │
    -- ╰─────────────────────────────────────────────────────────╯
    require("mason").setup {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

    -- will have an /lsp/<config>.lua
    local ensure_installed_lsp = {
      "html",
      "cssls",
      "bashls",
      "jsonls",
      "vale_ls",
      "marksman",
      "lua_ls",
      "pyright",
      "ruff_lsp",
    }

    local ensure_installed_other = {
      -- formaters and linters
      "mypy",
      "stylua",
      "prettier",
      "debugpy",
      "ruff",
    }

    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed_lsp,
      automatic_installation = true,
    }

    require("mason-tool-installer").setup {
      ensure_installed = ensure_installed_other,
      auto_update = true,
      run_on_start = true,
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
      },
    }

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ lspconfig on-attach()                                   │
    -- ╰─────────────────────────────────────────────────────────╯
    -- Note: I perfer the on_attach method vs the autocmd
    local function custom_attach(client, bufnr)
      --
      -- change capabilites based on lsp
      if client.name == "ruff_lsp" then
        print "Ruff_Lsp"
        client.server_capabilities.hoverProvider = false
        -- client.server_capabilities.publishDiagnostics = false
      end

      buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Lsp Hover Info" })

      buf_keymap(
        bufnr,
        "n",
        "gd",
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        { desc = "Lsp Jump to Definition" }
      )

      buf_keymap(
        bufnr,
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<cr>",
        { desc = "Lsp Jump to Declaration" }
      )

      buf_keymap(
        bufnr,
        "n",
        "gi",
        "<cmd>lua vim.lsp.buf.implementation()<cr>",
        { desc = "Lsp Jump to implementation" }
      )

      buf_keymap(
        bufnr,
        "n",
        "go",
        "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        { desc = "Lsp Jump to Definition of Symbol" }
      )

      buf_keymap(
        bufnr,
        "n",
        "gr",
        "<cmd>lua vim.lsp.buf.references()<cr>",
        { desc = "Lsp List All References" }
      )

      buf_keymap(
        bufnr,
        "n",
        "gs",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        { desc = "Lsp Signature Help" }
      )

      buf_keymap(
        bufnr,
        "n",
        "gl",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        { desc = "Lsp Show Diag Floating Window" }
      )

      -- ----------------------------------------------------------------------------

      buf_keymap(
        bufnr,
        "n",
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
        -- '<cmd>Format<CR>',
        { desc = "Lsp Format" }
      )

      buf_keymap(
        bufnr,
        "n",
        "<leader>la",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        { desc = "Lsp Code Action" }
      )

      buf_keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })

      buf_keymap(
        bufnr,
        "n",
        "<leader>lj",
        "<cmd>lua vim.diagnostic.goto_next()<cr>",
        { desc = "Lsp Next Diag" }
      )

      buf_keymap(
        bufnr,
        "n",
        "<leader>lk",
        "<cmd>lua vim.diagnostic.goto_prev()<cr>",
        { desc = "Lsp Prev Diag" }
      )

      -- toggle inline hints
      buf_keymap(
        bufnr,
        "n",
        "<leader>lh",
        ":lua vim.cmd('DiagnosticsToggleVirtualText')<CR>",
        { desc = "Lsp Toggle Inline Hints" }
      )

      -- toggle diagnostics
      buf_keymap(
        bufnr,
        "n",
        "<leader>lH",
        ":lua vim.cmd('DiagnosticsToggle')<CR>",
        { desc = "Lsp Toggle Diagnostics" }
      )

      buf_keymap(
        bufnr,
        "n",
        "<leader>ll",
        "<cmd>lua vim.lsp.codelens.run()<cr>",
        { desc = "Lsp Codelens Action" }
      )

      buf_keymap(
        bufnr,
        "n",
        "<leader>lq",
        "<cmd>lua vim.diagnostic.setloclist()<cr>",
        { desc = "Lsp Quickfix" }
      )

      buf_keymap(
        bufnr,
        "n",
        "<leader>lr",
        "<cmd>lua vim.lsp.buf.rename()<cr>",
        { desc = "Lsp Rename" }
      )

      -- ╭─────────────────────────────────────────────────────────╮
      -- │ Helpers                                                 │
      -- ╰─────────────────────────────────────────────────────────╯

      -- Command to toggle inline diagnostics
      vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
        local current_value = vim.diagnostic.config().virtual_text
        if current_value then
          vim.diagnostic.config { virtual_text = false }
        else
          vim.diagnostic.config { virtual_text = true }
        end
      end, {})

      -- Command to toggle diagnostics
      vim.api.nvim_create_user_command("DiagnosticsToggle", function()
        local current_value = not vim.diagnostic.is_enabled()
        if current_value then
          vim.diagnostic.enable()
        else
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end
      end, {})
    end
    -- ╭─────────────────────────────────────────────────────────╮
    -- │ End custom_attach()                                     │
    -- ╰─────────────────────────────────────────────────────────╯


    -- ╭─────────────────────────────────────────────────────────╮
    -- │ change the flags                                        │
    -- ╰─────────────────────────────────────────────────────────╯
    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = "",
      })
    end

    sign { name = "DiagnosticSignError", text = "✘" }
    sign { name = "DiagnosticSignWarn", text = "▲" }
    sign { name = "DiagnosticSignHint", text = "⚑" }
    sign { name = "DiagnosticSignInfo", text = "»" }

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ config the lsps                                         │
    -- ╰─────────────────────────────────────────────────────────╯

    -- build capabilities
    local function cmp_capabilities()
      local mcap = vim.lsp.protocol.make_client_capabilities()
      mcap.textDocument.completion.completionItem.snippetSupport = true
      mcap.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

      return require("cmp_nvim_lsp").default_capabilities(mcap)
    end

    -- Disable all formating (use conform)
    lsputil.default_config.format = {
      timeout_ms = nil,
      formatting_options = nil,
    }

    -- Set UI tables/vars
    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    require("lspconfig.ui.windows").default_options.border = "rounded"

    -- Config Diag Messages/Icons
    vim.diagnostic.config {
      signs = true,
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        -- style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    }

    -- Config the Individual Servers
    for _, server in pairs(ensure_installed_lsp) do
      local opts = {}
      opts = {
        on_attach = custom_attach,
        capabilities = cmp_capabilities(),
      }
      -- "lsps" ref folder with list of lsps
      local require_ok, settings = pcall(require, "lsps" .. "." .. server)
      if require_ok then
        -- print(require_ok)
        -- tprint(settings)
        opts = vim.tbl_deep_extend("force", settings, opts)
      end

      if server == "lua_ls" then
        require("neodev").setup {}
      end

      lspconfig[server].setup(opts)
    end
  end,
}
--
