return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio', -- async lib used by nvim-dap-ui and others
    "mfussenegger/nvim-dap-python",
  },

  config = function()
    require('neodev').setup {
      library = { plugins = { 'nvim-dap-ui' }, types = true },
    }

  -- On the todo list

  end,

}

-- dependencies = {
--   'mfussenegger/nvim-dap-python',
--   config = function()
--     require('dap-python').setup() -- Use default python
--   end,
-- },

-- local dap = require('dap')
-- dap.adapters.python = {
--   type = 'executable';
--   command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
--   args = { '-m', 'debugpy.adapter' };
-- }
