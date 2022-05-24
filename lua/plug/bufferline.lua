local map = require'core.util'.map
local m = require'core.config'.pmap.bufferline
local o = {}

o.config = function()
	require'bufferline'.setup {
		options = {
			offsets = {
				{
					filetype = 'neo-tree',
					padding = 1
				}
			},
		},
	}

  map('n', m.cyc_prev , ':BufferLineCyclePrev<cr>')
  map('n', m.cyc_next , ':BufferLineCycleNext<cr>')
  map('n', m.move_prev, ':BufferLineMovePrev<cr>')
  map('n', m.move_next, ':BufferLineMoveNext<cr>')
end

return o
