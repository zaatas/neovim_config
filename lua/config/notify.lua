-- ╭─────────────────────────────────────────────────────────╮
-- │ A fancy, configurable, notification manager             │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup {
      render = "minimal",
      stages = "slide",
      timeout = 3200,
      fps = 30,
    }

    vim.notify = require "notify"
  end,
}
