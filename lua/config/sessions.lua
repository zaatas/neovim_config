-- ╭─────────────────────────────────────────────────────────╮
-- │ Flexible session management                             │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "jedrzejboczar/possession.nvim",
  config = function()
    require("possession").setup {
      prompt_no_cr = true,
      autosave = {
        current = true, -- or fun(name): boolean
        tmp = false, -- or fun(): boolean
        tmp_name = "tmp", -- or fun(): string
        on_load = true,
        on_quit = true,
      },
      -- hooks = {
      --   before_save = function(name) return {} end,
      --   after_save = function(name, user_data, aborted) end,
      --   before_load = function(name, user_data) return user_data end,
      --  after_load = function(name, user_data) end,
      -- },
      plugins = {
        nvim_tree = true,
      },
      commands = {
        save = "SSave",
        load = "SLoad",
        delete = "SDelete",
        list = "SList",
      },
      telescope = {
        previewer = {
          enabled = true,
          previewer = "pretty", -- or 'raw' or fun(opts): Previewer
          wrap_lines = true,
          include_empty_plugin_data = false,

          cwd_colors = {
            cwd = "Comment",
            tab_cwd = { "#cc241d", "#b16286", "#d79921", "#689d6a", "#d65d0e", "#458588" },
          },
        },
        list = {
          default_action = "load",
          mappings = {
            -- save = { n = "ss", i = "<c-s>" },
            load = { n = "sl", i = "<c-s>l" },
            delete = { n = "sd", i = "<c-s>d" },
            rename = { n = "sr", i = "<c-s>r" },
          },
        },
      },
    }
    -- ------------------------------------------------------
    keymap("n", "<leader>fs", "<cmd>SSL<cr>", { desc = "Possession Saved Session List" })

    -- keymap("ca", "sl", "SSL", { desc = "Saved Session List" })

    command("SSL", function()
      require("telescope").extensions.possession.list(require("telescope.themes").get_ivy {
        -- prompt_title = "Saved Sessions",
        prompt_title = false,
        results_title = false,
        dynamic_preview_title = false,
        preview = true,
        initial_mode = "insert",
        layout_config = { height = 14 },
      })
    end, { desc = "Possession Saved Session List" })

    keymap("n", "<leader>fS", function()
      local session_name = vim.fn.input "> Session Name: "
      require("possession").save(session_name)
    end, { desc = "Possession Saved A New Session" })
  end,
}
