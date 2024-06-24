-- ╭─────────────────────────────────────────────────────────╮
-- │ A high-performance color highlighter                    │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "norcalli/nvim-colorizer.lua",
  lazy = false,
  config = function()
    require 'colorizer'.setup()
    -- #FF76A3

    command("Coloron",
      "ColorizerAttachToBuffer",
      { desc = "Attach Colorizer to the active buffer", silent = true })

    command("Colorff",
      "ColorizerDetachFromBuffer",
      { desc = "Detach Colorizer to the active buffer", silent = true })

    command("Color", "ColorizerToggle",
      { desc = "Toggle Colorizer on the active buffer", silent = true })
  end
}
