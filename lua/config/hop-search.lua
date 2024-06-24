-- ╭─────────────────────────────────────────────────────────╮
-- │ Easymotion like search                                  │
-- ╰─────────────────────────────────────────────────────────╯
return {
  "smoka7/hop.nvim",
  version = "*",
  config = function()
    require("hop").setup {
      -- hint_offset = 1,
      keys = "etovxqpdygfblzhckisuran",

      quit_key = "<SPC>",

      case_insensitive = true,

      jump_on_sole_occurrence = false,

      multi_windows = false,
      uppercase_labels = true,
      create_hl_autocmd = true,
      current_line_only = false,

      hint_position = require("hop.hint").HintPosition.START,

      -- Repace F and f
      keymap("n", "f", function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = false,
        }
      end, { desc = "Hop 1 Char (Replace f)" }),

      keymap("n", "F", function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = false,
        }
      end, { desc = "Hop 1 Char (Replace F)" }),

      -- Search line
      keymap("n", "sl", function()
        require("hop").hint_lines {}
      end, { desc = "Hop To A Line)" }),

      -- Super Search - pattern
      keymap("n", "ss", "<cmd>HopPattern<CR>", { desc = "Hop Pattern Search)" }),
    }
  end,
}
