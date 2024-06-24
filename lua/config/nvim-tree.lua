-- ╭─────────────────────────────────────────────────────────╮
-- │ File Tree                                               │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "nvim-tree/nvim-tree.lua",
  lazy=false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- keymap("ca", "ntt", "NvimTreeToggle", { desc = "Toggle Nvim Tree" })
    -- keymap("ca", "ntr", "NvimTreeRefresh", { desc = "Refresh Nvim Tree" })
    -- command("Nt", "NvimTreeFindFileToggle", { desc = "Nvim-Tree Toggle", silent = true })

    -- open file after creation
    local api = require "nvim-tree.api"
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)

    -- Use single hotkeys to toggle/focus nvim-tree:
    -- If nvim-tree is focused - close it
    -- Or always focus nvim-tree otherwise
    local nvimTreeFocusOrToggle = function()
      local nvimTree = require "nvim-tree.api"
      local currentBuf = vim.api.nvim_get_current_buf()
      local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
      if currentBufFt == "NvimTree" then
        nvimTree.tree.toggle()
      else
        nvimTree.tree.focus()
      end
    end

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Nvim-Tree Keymaps                                       │
    -- ╰─────────────────────────────────────────────────────────╯
    vim.keymap.set("n", "<leader>e", nvimTreeFocusOrToggle)

    keymap("n", "<leader>E", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle Nvim FindTree" })
    keymap("ca", "nt", "NvimTreeFindFileToggle", { desc = "Toggle Nvim FindTree" })

    require("nvim-tree").setup {
      sync_root_with_cwd = true,

      update_cwd = true,
      respect_buf_cwd = true,
      auto_reload_on_write = true,

      sort_by = "name",

      view = {
        -- width = 30,
        -- height = 30,
        side = "right",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      renderer = {
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
          icons = {
            -- corner = "└",
            corner = "┊",
            edge = "",
            item = "┊",
            -- bottom = "─",
            bottom = "",
            none = "  ",
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          git = false,
          profile = false,
        },
      },
    }

    -- make prettier
    vim.cmd [[ highlight NvimTreeFolderArrowClosed  guifg=#3FC5FF ]]
    vim.cmd [[ highlight NvimTreeFolderArrowOpen    guifg=#3FC5FF ]]

    vim.cmd [[ highlight NvimTreeOpenedFile         guifg=#00CC00 ]]
    vim.cmd [[ highlight NvimTreeModifiedFile       guifg=#ff5b77 ]]

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
