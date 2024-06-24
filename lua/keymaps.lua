-- ╭─────────────────────────────────────────────────────────╮
-- │ Keymaps                                                 │
-- ╰─────────────────────────────────────────────────────────╯
-- ------------------------------------------------------------------
--  keymap("n", ";", ":", {desc="Map ex ; to :"})

keymap("n", "H", "^", { desc = "Goto Beginning of line"})
keymap("n", "L", "$", { desc = "Goto End of line"})

-- ------------------------------------------------------------------

keymap("i", "<C-h>", "<Left>", { desc = "(I)Cursor move left" })
keymap("i", "<C-l>", "<Right>", { desc = "(I)Cursor move right" })

keymap("n", "gf", ":vertical wincmd  f<CR>", { desc = "Open file name under cursor in vsplit" })

keymap("n", "gfc", ":call CreateFile(expand('<cfile>'))<CR>", { desc = "Create file using fname under the cursor" })

keymap("n", "gl", "`.", { desc = "Goto last pos in active buffer" })
keymap("n", "gb", "<C-^>", { desc = "Goto last buffer" })

keymap("n", "<Leader>gc", "YI<Esc>p<cmd>Commentary<CR>", { desc = "Dup line / Comment original" })
-- keymap("n", "<leader><CR>", "<cmd>:noh<CR>", { desc = "nohl each time cr is presses" })

keymap("n", '<A-H>', ':vertical resize +1<CR>', { desc = 'Win Resize + Vertical' })
keymap("n", '<A-L>', ':vertical resize -1<CR>', { desc = 'Win Resize - Vertical' })
keymap("n", '<A-J>', ':resize -1<CR>', { desc = 'Win Resize - Horz' })
keymap("n", '<A-K>', ':resize +1<CR>', { desc = 'Win Resize + Horz' })

keymap("n", '<Leader>j', 'mzJ`z', { desc = 'Join lines keep cursor pos' })
keymap("n", '<Leader>J', 'mzi<CR><Esc>`z', { desc = 'Split line keep cursor pos' })

keymap("n", '<Leader>i', 'i<Space><Esc><Esc>', { desc = 'Insert n spaces at cursor' })

keymap("n", '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
keymap("n", '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

keymap("x", '<A-j>', ":move '>+1<CR>gv-gv", { desc = 'Visual Move line down' })
keymap("x", '<A-k>', ":move '<-2<CR>gv-gv", { desc = 'Visual Move line up' })

keymap("v", '<A-j>', ":move '>+1<CR>gv-gv", { desc = 'Visual Move line down' })
keymap("v", '<A-k>', ":move '<-2<CR>gv-gv", { desc = 'Visual Move line up' })

keymap("n", '<C-A-k>', ':call AddEmptyLineAbove()<CR>', { desc = 'Insert blank line ubove' })
keymap("n", '<C-A-j>', ':call AddEmptyLineBelow()<CR>', { desc = 'Insert blank line below' })

keymap("n", '<S-A-j>', ':call ScrollOtherWindow(1)<CR>', { desc = 'Scroll Other Win Up' })
keymap("n", '<S-A-k>', ':call ScrollOtherWindow(0)<CR>', { desc = 'Scorll Other Win Down' })

keymap("n", 'j', 'gj', { desc = 'Use gj vs j for para nav' })
keymap("n", 'k', 'gk', { desc = 'Use gk vs k for para nav' })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

keymap("n", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Nav h Window Splits" })
keymap("n", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Nav l Window Splits" })
keymap("n", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Nav j Window Splits" })
keymap("n", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Nav k Window Splits" })

-- If press h on head, fold close. zc
vim.cmd("nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'za'   : 'h'")
vim.cmd("xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zagv' : 'h'")

-- If press l or o on fold, fold open.
vim.cmd("nnoremap <expr> o foldclosed(line('.')) != -1 ? 'zo0'   : 'l'")
vim.cmd("xnoremap <expr> o foldclosed(line('.')) != -1 ? 'zogv0' : 'l'")

keymap({ 'n', 'v' }, "<C-u>", "<C-u>zz", { desc = "Center Cursor <C-u> Pging" })
keymap({ 'n', 'v' }, "<C-d>", "<C-d>zz", { desc = "Center Cursor <C-d> Pging" })
keymap({ 'n', 'v' }, "<C-f>", "<C-f>zz", { desc = "Center Cursor <C-f> Pging" })
keymap({ 'n', 'v' }, "<C-b>", "<C-b>zz", { desc = "Center Cursor <C-b> Pging" })

keymap({ "n", "v" }, "n", "nzz", { desc = "When jump next search/match center screen" })
keymap({ "n", "v" }, "N", "Nzz", { desc = "When jump next search/match center screen" })

-- Write and close window buffer - buffer remains in jump list
vim.cmd("command! W silent update | silent BufDel")
keymap('n', '<leader>w', ':update!<CR>', { desc="Save Current Buffer" })

vim.keymap.set('n', '<C-w>c', ':call SmartClose()<CR>', { noremap = true, silent = true })

-- Make shift same a tab
vim.keymap.set('n', '>', '>>_', { noremap = true, silent = true })
vim.keymap.set('n', '<', '<<_', { noremap = true, silent = true })

-- Visual -- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Paste keep cursor position
keymap("n", "p", "p`[", { noremap = true, silent = true })

-- Replace word with last yank
keymap('n', 'P', '\"_diwP', { noremap = true, silent = true })

-- Yank to EOL
keymap("n", "Y", "y$", { noremap = true, silent = true })

-- After visual yank, put cursor at top of block
keymap('v', 'y', 'y`[', { noremap = true, silent = true })

-- ------------------------------------------------------------------
-- End
-- ------------------------------------------------------------------
