-- Netrw tree list style
vim.cmd 'let g:netrw_liststyle = 3'

-- [[ Setting options ]]
-- See `:help opt` `:help option-list`
local opt = vim.opt
--
-- Filetype
vim.filetype.add {
  extension = {
    brief = 'brief',
  },
}

-- Block cursor in insert mode
opt.guicursor = ''

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 4 -- spaces for tabs
opt.shiftwidth = 4 -- spaces for indent width
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Enable break indent
opt.breakindent = true

-- Disable autowrappig
opt.wrap = false

-- Search settings
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- mixed case assumes case-sensitive

-- Show which line your cursor is on
opt.cursorline = true

-- Enables 24-bit RGB color
opt.termguicolors = true

-- Colorschemes that can be light or dark will be made dark
opt.background = 'dark'

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Backspace
-- Allow backspace on indent, end of line or insert mode
opt.backspace = 'indent,eol,start'

-- Sync clipboard between OS and Neo
--  Remove this option if you want your OS clipboard to remain independent.
opt.clipboard = 'unnamedplus'

-- Configure how new splits should be opened
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split gorizaontal window to the bottom

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Column showing line length limit
opt.colorcolumn = '80'

-- Save undo history
opt.undofile = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
