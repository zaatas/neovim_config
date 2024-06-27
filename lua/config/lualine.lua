-- ╭─────────────────────────────────────────────────────────╮
-- │ Nvim Status Line                                        │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine", -- need to set this up
    "nvim-tree/nvim-web-devicons",
  },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ Helper function                                         │
  -- ╰─────────────────────────────────────────────────────────╯
  config = function()
    -- The venv-selector venv function not working... so I made this for now
    -- Show active env on status line
    local function get_venv()
      if vim.bo.filetype == "python" then
        -- local venv = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_DEFAULT_ENV"
        local venv = os.getenv "VIRTUAL_ENV"
        if venv then
          local last_two_elements = string.match(venv, "([^/\\]+/[^/\\]+)$")
          return last_two_elements
        end
      end
      return " "
    end

    require("lualine").setup {
      --
      extensions = { "nvim-tree", "quickfix", "man" },

      options = {
        icons_enabled = true,
        theme = "solarized",
        -- theme = "material-stealth",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,

        ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_a = { "mode" },
        -- lualine_b = { "branch", "diagnostics" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            path = 1, -- 0=filename 1=relitive 2=absolute
            file_status = true,
            -- shorting_target = 25,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { get_venv, "progress" },

        -- lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 2,           -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      -- sections = {
      --    lualine_a = {},
      --    lualine_b = { "branch" },
      --    lualine_c = { "diagnostics" },
      --    lualine_x = { "copilot", "filetype" },
      --    lualine_y = { "progress" },
      --    lualine_z = {},
      --},
    }
  end,
}
