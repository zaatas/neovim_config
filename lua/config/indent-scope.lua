-- ╭─────────────────────────────────────────────────────────╮
-- │ Visualize Indentation and Operate on Indent Scope       │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "echasnovski/mini.indentscope",
  version = false,

  init = function()
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      callback = function()
        -- if vim.bo.buftype == "terminal" then
        --print( vim.bo.buftype)
        -- print(vim.api.nvim_buf_get_name(0))

        if
          string.find(vim.api.nvim_buf_get_name(0), "NvimTree_1")
          or vim.bo.buftype == "terminal"
        then
          vim.b.miniindentscope_disable = true
        else
          vim.b.miniindentscope_disable = false
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,

  config = function()
    require("mini.indentscope").setup {
      draw = {
        delay = 10,
        -- Symbol priority. Increase to display on top of more symbols.
        priority = 2,
        -- turn animation off by returing 0
        animation = function()
          return 0
        end,
      },
      options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = "both",

        -- Whether to use cursor column when computing reference indent.
        -- Useful to see incremental scopes with horizontal cursor movements.
        indent_at_cursor = false,

        -- Whether to first check input line to be a border of adjacent scope.
        -- Use it if you want to place cursor on function header to get scope of
        -- its body.
        try_as_border = true,
      },
      symbol = "│",
      -- symbol = "┊",

      vim.cmd [[
         highlight MiniIndentscopeSymbol  guifg=#1C3940

      ]],
    }
  end,
}
