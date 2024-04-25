-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

-- Exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- Clear search highlights
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix [L]ocation List' })
keymap.set('n', '<leader>qf', vim.diagnostic.setqflist, { desc = 'Open diagnostic [Q]uick[F]ix List' })
keymap.set('n', '<leader>qc', '<cmd>cexpr []<CR>', { desc = '[Q]uickfix [C]lear diagnostic List' })
keymap.set('n', '<leader>cq', '<cmd>cclose<CR>', { desc = '[C]lose [Q]uickfix diagnostic List' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Open netrw
keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })

-- Save like in the most common editors
keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save on Ctrl + s' })

-- Move selected lines in visual mode
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected code down (visual mode)' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected code up (visual mode)' })

-- Keep cursor in place when press J
keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep cursor in place when press J' })

-- Center screen on Ctrl+u, Ctrl+d moves
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center screen on Ctrl + u move' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center screen on Ctrl + d move' })

-- Center screen on next
keymap.set('n', 'n', 'nzzzv', { desc = 'Center screen on next' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Center screen on prev' })

-- GIGA yankers and pasters
keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste from system clipboard' })
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Del and yank into system clipboard' })
keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank into system clipboard' })
keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank curr line into system clipboard' })

-- Better indenting
keymap.set('v', '<', '<gv', { desc = 'Indent v-block to right' })
keymap.set('v', '>', '>gv', { desc = 'Indent v-block to left' })

-- Disable Q
keymap.set('n', 'Q', '<nop>', { desc = 'Disable Q' })

-- Move between buffers
keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- Location and quickfix movements
keymap.set('n', '<C-n>', '<cmd>cnext<CR>zz', { desc = 'Move to the next entity in quickfix' })
keymap.set('n', '<C-m>', '<cmd>cprev<CR>zz', { desc = 'Move to the previous entity in quickfix' })
keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Center cursor and screen on one line movements
keymap.set('n', '<C-e>', '<C-e>jzz', { desc = 'Center cursor and screen on one line down movement ' })
keymap.set('n', '<C-y>', '<C-y>kzz', { desc = 'Center cursor and screen on one line up movement ' })

-- Toggle undo tree
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })

-- Make code rain
keymap.set('n', '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = 'Make cool code rain' })

-- Run sql formatter pg_format on the entire file
keymap.set('n', '<leader>fs', '<cmd>%!pg_format<cr>', { desc = 'Format SQL file' })

-- Open messages
keymap.set('n', '<leader>m', '<cmd>messages<CR>', { desc = 'Show messages' })

-- Vim-go
keymap.set('n', '<leader>fi', '<cmd>GoIfErr<CR>', { desc = 'Insert if err != nil block' })
keymap.set('n', '<leader>tc', '<cmd>GoCoverageToggle<CR>', { desc = 'Toggle test coverage in Go files' })

-- Windows controlling keymaps
keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
keymap.set('n', '<leader>wqa', '<cmd>wqa<CR>', { desc = 'Close all windows' })
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Equalyze width of the windows' })
keymap.set('n', '<leader>w<', '<C-w>25<', { desc = 'Decrease current window width' })
keymap.set('n', '<leader>w>', '<C-w>25>', { desc = 'Increase current window width' })
keymap.set('n', '<leader>w-', '<C-w>15-', { desc = 'Decrease current window height' })
keymap.set('n', '<leader>w+', '<C-w>15+', { desc = 'Increase current window weight' })
