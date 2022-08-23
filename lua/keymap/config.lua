local keymap = require('core.keymap')
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
	-- noremal remap
	-- close buffer
	{ '<Leader>bq', cmd('bdelete'), opts(noremap, silent) },
	{ '<Leader>ba', cmd('%bd|e#|bd#'), opts(noremap, silent) },
	-- save
	{ '<C-s>', cmd('write'), opts(noremap) },
	-- yank
	{ 'Y', 'y$', opts(noremap) },
	-- remove trailing white space
	-- { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
	-- window jump
	{ '<C-h>', '<C-w>h', opts(noremap) },
	{ '<C-l>', '<C-w>l', opts(noremap) },
	{ '<C-j>', '<C-w>j', opts(noremap) },
	{ '<C-k>', '<C-w>k', opts(noremap) },
	-- better maps
	{ 'n', 'nzzzv', opts(noremap) },
	{ 'N', 'Nzzzv', opts(noremap) },
	{ 'J', 'mzJ`z', opts(noremap) },
})

imap({
	-- insert mode
	{ '<C-h>', '<Bs>', opts(noremap) },
	{ '<C-e>', '<End>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })

xmap({
	{ '<s-tab>', '<gv' },
	{ '<tab>', '>gv' },
})
