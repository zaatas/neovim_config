-- ╭─────────────────────────────────────────────────────────╮
-- │ Helper function                                         │
-- ╰─────────────────────────────────────────────────────────╯
-- --------------------------------------------------------------------------
_G.command = function(cmd_name, action, description, other_opts)
  local options = { bang = true }
  options["desc"] = description
  if other_opts ~= nil then
    for k, v in pairs(other_opts) do
      options[k] = v
    end
  end
  vim.api.nvim_create_user_command(cmd_name, action, options)
end
-- --------------------------------------------------------------------------
function _G.keymap(mode, map_this, to_this, keymap_options)
  local options = {}

  if keymap_options["silent"] == {} then
    options["silent"] = true
  end
  if keymap_options["noremap"] == {} then
    options["noremap"] = true
  end

  if keymap_options then
    options = vim.tbl_extend("force", options, keymap_options)
  end

  vim.keymap.set(mode, map_this, to_this, options)
end

-- --------------------------------------------------------------------------
_G.buf_keymap = function(bufnr, mode, map_this, to_this, keymap_options)
  local options = {}

  if keymap_options["silent"] == nil then
    options["silent"] = true
  end
  if keymap_options["noremap"] == nil then
    options["noremap"] = true
  end

  if keymap_options then
    options = vim.tbl_extend("force", options, keymap_options)
  end

  vim.api.nvim_buf_set_keymap(bufnr, mode, map_this, to_this, options)
end
-- --------------------------------------------------------------------------
_G.tprint = function(tbl, indent)
  -- Print contents of `tbl`, with indentation.
  -- `indent` sets the initial level of indentation.
  if not indent then
    indent = 0
  end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent + 1)
    elseif type(v) == "boolean" then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
end
-- --------------------------------------------------------------------------
_G.dump = function(...)
  -- quickly print a lua table to :messages
  print(vim.inspect(...))
end
-- --------------------------------------------------------------------------
