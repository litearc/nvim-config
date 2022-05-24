local map = require'core.util'.map
local m = require'core.config'.pmap.comment
local o = {}

o.config = function()
	require'Comment'.setup {
		toggler = {
			line = m.tog_line,
			block = m.tog_block,
		},
		opleader = {
			line = m.line,
			block = m.block,
		}
	}
end

return o
