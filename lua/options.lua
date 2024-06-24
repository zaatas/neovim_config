-- ╭─────────────────────────────────────────────────────────╮
-- │ Neovim Options                                          │
-- ╰─────────────────────────────────────────────────────────╯
--
local o           = vim.o
local vo          = vim.opt
-- ╭─────────────────────────────────────────────────────────╮
-- │ Global Options                                          │
-- ╰─────────────────────────────────────────────────────────╯
vo.pumheight      = 15
vo.pumblend       = 20
vo.clipboard      = 'unnamedplus'      -- Allow use of system clipboard
vo.wildoptions    = 'pum'              -- Don't use GUI tabline
vo.whichwrap      = 'h,l,<,>,[,],~'
vo.backspace      = 'indent,eol,start' -- Intuitive backspacing in insert mode
vo.encoding       = 'utf-8'            -- The encoding displayed
vo.fileencoding   = 'utf-8'            -- The encoding written to file
vo.shortmess      = 'aoOTI'            -- Shorten messages and don't show intro
-- vo.shortmess:gsub('S', '')
vo.mouse          = 'a'                -- enable mouse in all modes
vo.mousemodel     = 'popup'            -- set the behaviour of mouse
-- vo.fileformats    = 'unix,dos'         -- File type preferences
vo.inccommand     = 'split'          -- live preview the :substitute command
vo.showbreak      = "\\\\"
-- vo.report         = 0
vo.undolevels     = 2000 -- Number of undo levels
vo.laststatus     = 3    -- Always show the status line
vo.showtabline    = 1    -- Show tabline
vo.updatetime     = 250  -- Frequency update
vo.timeoutlen     = 1000
-- vo.autoread       = true
vo.scrolloff      = 5    -- Keep at least 2 lines above/below
vo.sidescrolloff  = 5    -- Keep at least 5 lines left/right
--vo.showmatch      = true -- Highlight matching brace
vo.title          = true -- change the terminal's title
vo.lazyredraw     = true -- Only redraw when necessary
vo.splitbelow     = true -- New splits open to right and bottom
vo.splitright     = true
vo.hlsearch       = true -- Search highlighting
vo.incsearch      = true -- Search starts while entering string
vo.ignorecase     = true -- Search ignore case
vo.smartcase     = true -- Search ignore case unless search contains an uppercase
vo.infercase      = true -- Adjust case in insert completion mode
vo.wrapscan       = true -- Searches wrap around the end of the file
vo.showmatch      = true -- Jump to matching bracket
vo.cursorline     = true -- Color the cursorline
vo.backup         = false
vo.writebackup    = false
vo.swapfile       = false -- Turn off swap files
vo.hidden         = true  -- Buffer becomes hidden when abandoned to prevent need to save
-- vo.autoread       = true  -- if a file is changed outside Vim, automatically re-read it
vo.startofline    = false -- Cursor in same column for few commands
vo.showfulltag    = true  -- Show tag and tidy search in completion
vo.showmode       = false -- Don't show mode in cmd window
vo.showcmd        = false -- Don't show command in status line
vo.shiftround     = true  -- align indent to next multiple value of shiftwidth
vo.shiftwidth     = 2     -- Number of auto-indent spaces
vo.softtabstop    = 2     -- Number of spaces per Tab
vo.tabstop        = 2     -- insert 2 spaces for a tab
vo.smarttab       = true  -- Enable smart-tabs
vo.expandtab      = true  -- Insert spaces when tab pressed
-- vo.ruler          = false -- cursor postion
vo.autochdir      = true  -- Set the file path as pwd
vo.gdefault       = true  -- Set searching to global by default
vo.wildmenu       = true  -- Command line completion help
vo.wildignorecase = true  -- Ignore case when completing file names and directories.

vim.opt.synmaxcol = 240           -- max column for syntax highlight


vim.opt.spell = false
vim.opt.spelllang = { "en_us" }




-- ╭─────────────────────────────────────────────────────────╮
-- │ A list of file patterns to ignore when performing       │
-- │ expansion and completion.                               │
-- ╰─────────────────────────────────────────────────────────╯
vo.wildignore     = o.wildignore .. '*.so,/min/*'
vo.wildignore     = o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'
vo.wildignore     = o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'
vo.wildignore     = o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'
vo.wildignore     = o.wildignore .. '__pycache__,*.egg-info'
vo.wildignore     = o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'
vo.wildignore     = o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'
vo.wildignore     = o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'

-- ╭─────────────────────────────────────────────────────────╮
-- │ window-local options                                    │
-- ╰─────────────────────────────────────────────────────────╯
vo.number         = true -- Show line numbers

vo.foldcolumn     = '1'
-- vo.nofoldenable   = true -- on start no folding

-- Defaults
vo.foldlevel      = 0
vo.foldnestmax    = 10
vo.foldmethod     = 'marker' -- Autofolding
vo.foldmarker     = '{{{, }}}'
vo.breakindent    = true     -- Make every wrapped line visually indented.

-- Create an augroup for file type specific folding settings
vim.cmd([[
augroup FileTypeFolding
    autocmd!
    " the config is in treesitter
     autocmd BufEnter *.py :set foldmethod=expr
     autocmd BufEnter *.py :set foldlevel=99
     autocmd BufEnter *.py :set foldexpr=nvim_treesitter#foldexpr()

    " Lua folding settings
    autocmd BufEnter *.lua :setlocal foldlevel=99
    autocmd BufEnter *.lua :setlocal foldmethod=marker
    autocmd BufEnter *.lua :setlocal foldmarker=--{{{,--}}}

    " Add more file types and their folding settings as needed
augroup END
]])

-- ╭─────────────────────────────────────────────────────────╮
-- │ buffer-local options                                    │
-- ╰─────────────────────────────────────────────────────────╯
vo.omnifunc       = 'lsp#omnifunc' -- use omni completion provided by lsp
vo.textwidth      = 100            -- Line wrap (number of cols)
vo.autoindent     = true           -- Uses indent from previous line
vo.smartindent    = true           -- Like cindent except lil' more clever
vo.copyindent     = true           -- Copy the structure of existing line's indent when autoin

vo.listchars      = {
  -- eol = "↴",
  tab = "» ",
  space = " ",
  trail = ' ',
  nbsp = '␣',
  precedes = "«",
  extends = "»"
}

vo.relativenumber = true -- set relative numbered lines
-- vo.undofile = true     -- Save undo history
vo.signcolumn     = "yes"                     -- always show the sign column, otherwise it would shift the text each time
vo.list           = true                      -- Sets how neovim will display certain whitespace in the editor.

vo.cmdheight      = 1                         -- more space in the neovim command line for displaying messages
vo.completeopt    = { "menu", "noselect" } -- mostly just for cmp
vo.conceallevel   = 0                         -- so that `` is visible in markdown files
vo.termguicolors  = true                      -- set term gui colors (most terminals support this)

vo.numberwidth    = 4                         -- set number column width to 2 {default 4}
vo.wrap           = false                     -- display lines as one long line

vo.fillchars      = vim.opt.fillchars + "eob: "
vo.fillchars:append {
  stl = " ",
}

local globalListenerName = 'globallistenername'
local autocmdhandlers    = {}

_G[globalListenerName]   = function(name)
  autocmdhandlers[name]()
end

-- ╭─────────────────────────────────────────────────────────╮
-- │ Variables                                               │
-- ╰─────────────────────────────────────────────────────────╯
vim.g.have_nerd_font     = true -- Set to true if you have a Nerd Font installed
vim.cmd("set sessionoptions-=buffers")

vim.g.vimsyn_embed = "l"   -- Lua syntax highlighting

vim.g.netrw_mouse = 2
vim.g.netrw_banner = 0




-- vim.opt.ruler = false
-- colorcolumn = "80",
-- colorcolumn = "120",

-- vim.opt.shortmess:append "c"
-- vim.cmd [[set iskeyword+=-]]
--
-- ╭─────────────────────────────────────────────────────────╮
-- │ End Nvim Options                                        │
-- ╰─────────────────────────────────────────────────────────╯
