local c = require'config'.opt
local o = vim.opt
local g = vim.g
local cmd = vim.cmd

o.autoindent = true
o.smartindent = true
o.tabstop = c.tabwidth
o.softtabstop = c.tabwidth
o.shiftwidth = c.tabwidth
o.shiftround = true
o.expandtab = true
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
o.laststatus = 2
o.statusline = '%t%=%-14(%l,%c%V%)%<%P'

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

-- TODO: set lsp options + signs
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.diagnostic.on_publish_diagnostics,
--   {
--     virtual_text = false,
--     signs = true,
--     underline = true,
--   }
-- )

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

-- disable builtin vim plugins
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit'
}
for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end

-- maintain view when switching buffers. taken from:
-- https://stackoverflow.com/questions/4251533/vim-keep-window-position-when-switching-buffers
cmd [[ au BufLeave * let b:winview = winsaveview() ]]
cmd [[ au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif ]]

-- disable line numbers in terminal:
-- https://stackoverflow.com/questions/63906439/how-to-disable-line-numbers-in-neovim-terminal
cmd [[ au TermOpen * setlocal nonumber norelativenumber ]]
