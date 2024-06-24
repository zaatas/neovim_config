return {
    "ntpeters/vim-better-whitespace",
    config = function ()
        vim.g.better_whitespace_enabled  = 1
        vim.g.better_whitespace_guicolor = "#073642"
        vim.g.strip_whitelines_at_eof    = 1
        vim.g.strip_whitespace_on_save   = 1
        vim.g.strip_whitespace_confirm   = 0

-- :StripWhitespace
-- :EnableWhitespace
-- :DisableWhitespace
-- :ToggleWhitespace

        vim.cmd([[
        " vim.cmd("let g:better_whitespace_ctermcolor='#073642')
        let g:better_whitespace_filetypes_blacklist=['diff','gitcommit','qf','help','markdown']
       ]])
    end
}
--
