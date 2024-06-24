return {

  'ishan9299/nvim-solarized-lua',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.solarized_visibility = 'normal'
    vim.g.solarized_italics = 1
    vim.g.solarized_diffmode = 'normal'
    vim.g.solarized_statusline = 'flat'  -- flat low normal
    vim.cmd('colorscheme solarized-flat')
  end
}
