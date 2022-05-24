local m = require'core.config'.pmap.neotree
local map = require'core.util'.map
local o = {}

o.config = function()
	require'neo-tree'.setup {
		enable_git_status = true,
		enable_diagnostics = false,
		default_component_configs = {
			indent = {
				with_markers = false,
				indent_size = 2,
				padding = 1,
			},
			icon = {
				folder_closed = '',
				folder_open = '',
				folder_empty = '',
			},
			modified = {
				symbol = '✚',
			},
			git_status = {
				symbols = {
					added = '',
					modified = '',
					deleted = "",
					renamed = "➜",
					untracked = "★",
					ignored = "◌",
					unstaged = "✗",
					staged = "✓",
					conflict = "✕",
				},
			},
			mappings = {
				[m.open] = 'open',
				[m.refresh] = 'refresh',
				[m.create] = {
					'add',
					config = {
						show_path = 'none',
					},
				},
				[m.create_dir] = {
					'add_directory',
					config = {
						show_path = 'none',
					},
				},
				[m.remove] = 'delete',
				[m.rename] = 'rename',
			},
		},
		filesystem = {
			window = {
				mappings = {
					[m.tog_dotfiles] = 'toggle_hidden',
					[m.find] = 'fuzzy_finder',
					[m.dir_up] = 'navigate_up',
					[m.cd] = 'set_root',
				}
			}
		},
	}

	map('n', m.toggle, ':Neotree toggle<cr>')
end

return o
