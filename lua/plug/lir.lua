local m = require'core.config'.pmap.lir
local o = {}

o.config = function()
	local actions = require'lir.actions'
	local mark_actions = require 'lir.mark.actions'
	local clipboard_actions = require'lir.clipboard.actions'
	vim.keymap.set('n', m.toggle, require'lir.float'.toggle)

	require'lir'.setup {
		show_hidden_files = false,
		devicons_enable = true,

		mappings = {
			['l']            = actions.edit,
			['<right>']      = actions.edit,
			['<cr>']         = actions.edit,
			['h']            = actions.up,
			['<left>']       = actions.up,
			[m.quit]         = actions.quit,
			[m.cd]           = actions.cd,
			[m.tog_dotfiles] = actions.toggle_show_hidden,
			[m.create_dir]   = actions.mkdir,
			[m.create]       = actions.newfile,
			[m.rename]       = actions.rename,
			[m.yank_path]    = actions.yank_path,
			[m.remove]       = actions.delete,
			[m.copy]         = clipboard_actions.copy,
			[m.cut]          = clipboard_actions.cut,
			[m.paste]        = clipboard_actions.paste,
		},

		float = {
			winblend = 0,
			curdir_window = {
				enable = false,
				highlight_dirname = false
			},
			win_opts = function()
				local width = math.floor(vim.o.columns * 0.5)
				local height = math.floor(vim.o.lines * 0.5)
				return {
					border = {
						"┌", "─", "┐", "│", "┘", "─", "└", "│",
					},
					width = width,
					height = height,
				}
			end,
		},
		hide_cursor = true,
	}
end

return o
