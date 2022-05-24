-- put commonly used vim functions into global namespace
_G.cmd = vim.cmd
_G.fn = vim.fn
_G.opt = vim.opt
_G.eval = vim.api.nvim_eval

-- load modules
local modules = {
	'plugins',
	'options',
	'mappings',
}
for _, module in ipairs(modules) do
	require('core.' .. module)
end

cmd 'colorscheme arc'
