local map = require'core.util'.map
local m = require'core.config'.pmap.diffview
local o = {}

o.config = function()
	local actions = require'diffview.actions'
	require'diffview'.setup {
		keymaps = {
			disable_defaults = true,
			view = {
				[m.prev] = actions.select_prev_entry,
				[m.next] = actions.select_next_entry,
			},
			file_panel = {
				[m.prev] = actions.prev_entry,
				[m.next] = actions.next_entry,
			}
		}
	}

  map('n', m.open , ':DiffviewOpen<cr>')
  map('n', m.prompt , ':DiffviewOpen ', {silent = false})
  map('n', m.close , ':DiffviewClose<cr>')
end

return o
