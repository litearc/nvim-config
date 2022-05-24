local ok, telescope = pcall(require, 'telescope')
if not ok then return end
local m = require'core.config'.pmap.telescope
local map = require'core.util'.map

local o = {}

o.config = function()
	telescope.setup {
		defaults = {
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--ignore-file=.gitignore'
			},
			prompt_prefix = '   ',
			selection_caret = '  ',
			sorting_strategy = 'ascending',
			layout_config = {
				horizontal = {
					prompt_position = 'top',
					preview_width = 0.5,
				},
			},
		},

	}

	-- set mappings
	map('n', m.grep       , ':Telescope live_grep<cr>'  )
	map('n', m.git_status , ':Telescope git_status<cr>' )
	map('n', m.commits    , ':Telescope git_commits<cr>')
	map('n', m.files      , ':Telescope find_files<cr>' )
	map('n', m.buffers    , ':Telescope buffers<cr>'    )
	map('n', m.history    , ':Telescope oldfiles<cr>'   )
end

return o
