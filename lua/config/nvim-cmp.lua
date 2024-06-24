-- ╭─────────────────────────────────────────────────────────╮
-- │ Completion engine                                       │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- completion sources
    { "hrsh7th/cmp-nvim-lsp",     event = "InsertEnter" },
    { "hrsh7th/cmp-emoji",        event = "InsertEnter" },
    { "hrsh7th/cmp-buffer",       event = "InsertEnter" },
    { "hrsh7th/cmp-path",         event = "InsertEnter" },
    { "hrsh7th/cmp-cmdline",      event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = { "rafamadriz/friendly-snippets" },
      version = "v2.*",
      build = "make install_jsregexp",
    },
    { "hrsh7th/cmp-nvim-lua" },
    { "onsails/lspkind.nvim" },
    { "uga-rosa/cmp-dictionary" },
  },
  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Completion                                              │
  -- ╰─────────────────────────────────────────────────────────╯
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"

    lspkind.init()
    require("luasnip/loaders/from_vscode").lazy_load()

    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    -- hook into nvim-autopairs
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Sources that req some config                            │
    -- ╰─────────────────────────────────────────────────────────╯
    require("cmp_dictionary").setup {
      paths = { "/usr/share/dict/words" },
      exact_length = 0,
      max_number_items = 4,
      debug = false,
      first_case_insensitive = false,
      document = {
        enable = false,
        command = { "wn", "${label}", "-over" },
      },
    }

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        {
          name = "buffer",
          max_item_count = 6,
        },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        {
          name = "path",
          max_item_count = 6,
        },
      }, {
        {
          name = "cmdline",
          keyword_length = 2,
          max_item_count = 6,
        },
      }),
    })
    --
    -- -------------------------------------------------------------------
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<A-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            -- require("neotab").tabout()
            fallback()
          else
            -- require("neotab").tabout()
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol_text",
          menu = {
            nvim_lsp = "[LSP]",
            luasnip = "[LS]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            buffer = "[Buf]",
            dictionary = "[Dic]",
          },
        },
      },
      sources = {
        --  { name = "copilot" },
        { name = "path" },
        { name = "nvim_lsp",   keyword_length = 1 },
        { name = "buffer",     keyword_length = 3 },
        { name = "luasnip",    keyword_length = 2 },
        { name = "nvim_lua" },
        { name = "dictionary", keyword_length = 2 },
      },
      completion = {
        keyword_length = 1,
        completeopt = "menu,noselect",
      },
      view = {
        entries = "custom",
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = {
          border = "rounded",
          scrollbar = false,
        },
        documentation = {
          border = "rounded",
        },
      },
      experimental = {
        ghost_text = false,
      },
    } -- end cmp-setup()
  end,
}
