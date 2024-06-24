return {
  -- ╭─────────────────────────────────────────────────────────╮
  -- │ A super powerful autopair plugin for Neovim that        │
  -- │ supports multiple characters.                           │
  -- ╰─────────────────────────────────────────────────────────╯
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require('nvim-autopairs').setup({
      check_ts = true,
      ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
      },
      disable_filetype = { "TelescopePrompt", "vim" },
    })

    -- treesitter config
    local npairs = require("nvim-autopairs")
    local Rule = require('nvim-autopairs.rule')
    local ts_conds = require('nvim-autopairs.ts-conds')

    -- press % => %% only while inside a comment or string
    npairs.add_rules({
      Rule("%", "%", "lua")
          :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
      Rule("$", "$", "lua")
          :with_pair(ts_conds.is_not_ts_node({ 'function' }))
    })
  end,

}
