local c = require'core.config'.opt
local o = vim.opt
local g = vim.g
local b = vim.b

o.autoindent = true
o.smartindent = true
o.tabstop = c.tabwidth
o.softtabstop = c.tabwidth
o.shiftwidth = c.tabwidth
o.shiftround = true
o.expandtab = false
o.smarttab = true
o.signcolumn = 'yes'
o.backspace = {'indent', 'eol', 'start'}

g.compatible = false
o.mouse = 'r'
o.clipboard = c.clipboard
o.wrap = c.wrap
o.whichwrap:append('<>hl[]')
o.textwidth = c.textwidth
o.cmdheight = c.cmdheight
o.formatoptions:remove('t')

o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.cursorline = true
o.number = c.number
o.relativenumber = false
o.joinspaces = false
o.wildmode = {'longest:full', 'full'}

o.hidden = true
o.backup = false
o.writebackup = false
o.swapfile = false

o.lazyredraw = true
o.completeopt = {'menuone', 'noselect'}
o.updatetime = c.updatetime

-- filename, space, line/char num, file position
o.laststatus = 3
o.statusline = ' '

g.t_co = 256
g.termguicolors = true
g.encoding = 'UTF-8'
g.mapleader = c.leader
g.python3_host_prog = 'python' -- can be a path

-- disable nvim intro
o.shortmess:append('sI')

-- disable tilde on end of buffer:
-- https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
o.fillchars = {eob = ' '}

vim.diagnostic.config(
	{
		virtual_text = false,
		signs = true,
		underline = true,
	}
)

vim.fn.sign_define('DiagnosticSignError',
	{text = '', texthl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn',
	{text = '', texthl = 'DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignHint',
	{text = '', texthl = 'DiagnosticSignHint'})
vim.fn.sign_define('DiagnosticSignInfo',
	{text = '', texthl = 'DiagnosticSignInfo'})

-- TODO: get proper folding to work
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldenable = true
o.foldlevel = 20

-- hide netrw banner
-- g['netrw_banner'] = 0
-- g['netrw_list_hide'] = [[^\./,^\.\./]]

-- disable builtin vim plugins
local disabled_built_ins = {
	'2html_plugin',
	'getscript',
	'getscriptPlugin',
	'gzip',
	'logipat',
	'matchit',
	'tar',
	'tarPlugin',
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'rrhelper',
	'spellfile_plugin',
	'vimball',
	'vimballPlugin',
	'zip',
	'zipPlugin',
}
for _, plugin in pairs(disabled_built_ins) do
	g['loaded_' .. plugin] = 1
end

-- maintain view when switching buffers. taken from:
-- https://stackoverflow.com/questions/4251533/vim-keep-window-position-when-switching-buffers
vim.api.nvim_create_autocmd('BufLeave', {
	pattern = '*',
	callback = function()
		b.winview = fn.winsaveview()
	end
})
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = '*',
	callback = function()
		if b.winview ~= nil then
			fn.winrestview(b.winview)
		end
	end
})

-- disable line numbers in terminal:
-- https://stackoverflow.com/questions/63906439/how-to-disable-line-numbers-in-neovim-terminal
vim.api.nvim_create_autocmd('TermOpen', {
	pattern = '*',
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end
})
