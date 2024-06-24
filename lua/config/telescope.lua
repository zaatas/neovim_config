-- ╭─────────────────────────────────────────────────────────╮
-- │ Amazing .. well everything                              │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },

    { "nvim-telescope/telescope-fzf-native.nvim",  build = "make", lazy = true },

    { "nvim-telescope/telescope-file-browser.nvim" },

    { "nvim-tree/nvim-web-devicons" },

    { "nvim-telescope/telescope-ui-select.nvim" },

    {
      "debugloop/telescope-undo.nvim",
      opts = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
      config = function(_, opts)
        keymap("n", "<leader>u", function()
          require("telescope").extensions.undo.undo()
        end, { desc = "Telescope Undo" })
      end

    },
  },

  config = function()
    keymap(
      "n",
      "<leader>bb",
      "<cmd>Telescope buffers previewer=false<CR>",
      { desc = "Tele Buffers" }
    )

    keymap("n", "<leader>ff", "<cmd>Telescope find_files <cr>", { desc = "Tele Find Files" })
    keymap("n", "<leader>fF", "<cmd>Telescope file_browser<cr>", { desc = "Tele File Browser" })

    keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Tele Recent Files" })

    keymap(
      "n",
      "<leader>fp",
      ":lua require('telescope').extensions.projects.projects()<cr>",
      { desc = "Tele Projects" }
    )

    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Tele Live Grep" })
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Tele Help Tags" })

    keymap(
      "n",
      "<leader>fv",
      "<cmd>Telescope command_history<cr>",
      { desc = "Tele Nvim Command History" }
    )

    --    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    --    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    --    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },

    keymap("n", "<leader>sh", function()
      require("telescope.builtin").help_tags(
        require("telescope.themes").get_dropdown { results_title = ">> NVIM Help by Tags <<" }
      )
    end, { desc = "NVIM [H]elp" })

    local actions = require "telescope.actions"

    vim.cmd [[
       highlight TelescopeSelection      guifg=#FF9500 gui=bold
       highlight TelescopeSelectionCaret guifg=#819C3B
       highlight TelescopeMultiSelection guifg=#4C96A8
       " highlight TelescopeNormal         guibg=#645f52
       highlight TelescopeBorder         guifg=#1a6091
       highlight TelescopePromptBorder   guifg=#1a6091
       highlight TelescopeResultsBorder  guifg=#1a6091
       highlight TelescopePreviewBorder  guifg=#1a6091
       highlight TelescopeMatching       guifg=#FF5813
       highlight TelescopePromptPrefix   guifg=#FF9950
    ]]

    require("telescope").setup {
      defaults = {
        border = true,
        use_less = true,
        wrap_results = false,
        scroll_strategy = "cycle",

        -- layout_strategy = "horizontal",    -- center, cursor, vertical, flex, bottom_pane

        layout_strategy = "bottom_pane",
        layout_config = {
          height = 0.4,
        },
        sorting_strategy = "ascending",
        -- sorting_strategy = "descending",

        cycle_layout_list = { "horizontal", "vertical" }, -- can be a table see docs
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        multi_icon = "+",
        hl_result_eol = false,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        dynamic_preview_title = false,
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        path_display = { "smart" },
        color_devicons = true,
        set_env = { COLORTERM = "truecolor" },
        --
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<esc>"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        live_grep = {
          theme = "ivy",
          layout_config = { height = 18 },
        },

        grep_string = {
          theme = "ivy",
          layout_config = { height = 18 },
        },

        find_files = {
          theme = "ivy",
          previewer = false,
          layout_config = { height = 18 },
        },
        oldfiles = {
          -- theme = "dropdown",
          theme = "ivy",
          prompt_title = "<-  History  ->",
          previewer = false,
          layout_config = { height = 18 },
        },
        buffers = {
          theme = "ivy",
          previewer = false,
          initial_mode = "insert",
          layout_config = { height = 12 },
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        command_history = {
          theme = "ivy",
          previewer = false,
          initial_mode = "insert",
          layout_config = { height = 12 },
        },

        planets = {
          show_pluto = true,
          show_moon = true,
        },
        colorscheme = {
          enable_preview = true,
        },
        -- Lsp --
        lsp_references = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_definitions = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_declarations = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_implementations = {
          theme = "ivy",
          initial_mode = "normal",
        },
      },
      extensions = {
        undo = {
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        projects = {},
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          override_file_sorter = true,    -- override the file sorter
          override_generic_sorter = true, -- override the generic sorter
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    require("telescope").load_extension "fzf"
    require("telescope").load_extension "ui-select"
    require("telescope").load_extension "notify"

    require("telescope").load_extension "projects"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "undo"

    -- vim.cmd [[
    --   autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
    --  ]]
  end,
}
