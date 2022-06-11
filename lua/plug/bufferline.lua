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
			custom_filter = function(buf, buf_nums)
				local ftype = vim.bo[buf].filetype
				local fname = vim.api.nvim_buf_get_name(buf)
				if ftype == 'help' or ftype == 'qf' then return false end
				if fname:find('fugitive://', 1, true) == 1 then return false end
				return true
			end
		},
	}

  map('n', m.cyc_prev , ':BufferLineCyclePrev<cr>')
  map('n', m.cyc_next , ':BufferLineCycleNext<cr>')
  map('n', m.move_prev, ':BufferLineMovePrev<cr>')
  map('n', m.move_next, ':BufferLineMoveNext<cr>')
end

return o
