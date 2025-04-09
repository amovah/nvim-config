local opt = vim.opt

vim.g.mapleader = " "

opt.termguicolors = true
opt.hidden = true
opt.magic = true
opt.virtualedit = "block"
opt.clipboard = "unnamedplus"
opt.wildignorecase = true
opt.swapfile = false

opt.history = 1000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.cursorline = true

opt.relativenumber = true

if vim.fn.executable("rg") == 1 then
	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

opt.completeopt = "menu,menuone,noselect"
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.ruler = false
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 15
opt.showcmd = false

-- opt.laststatus = 3
-- opt.list = true

--eol:¬
-- opt.listchars = "tab:» ,nbsp:+,trail:·,extends:→,precedes:←,"
opt.undofile = true

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2

opt.foldlevelstart = 99

opt.splitright = true
opt.wrap = false

opt.number = true
opt.signcolumn = "yes"
opt.spelloptions = "camel"

opt.textwidth = 100
opt.colorcolumn = "+0"

if vim.uv.os_uname().sysname == "Darwin" then
	vim.g.clipboard = {
		name = "macOS-clipboard",
		copy = {
			["+"] = "pbcopy",
			["*"] = "pbcopy",
		},
		paste = {
			["+"] = "pbpaste",
			["*"] = "pbpaste",
		},
		cache_enabled = 0,
	}
end
