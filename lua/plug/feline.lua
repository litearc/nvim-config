local o = {}

o.config = function()
	local base, colors = require('core.colors').colors(vim.g.colors_name)
	local plain = { fg = base['3'], bg = base['1'] }
	local sep1 = { str = ' '   , hl = plain }
	local sep2 = { str = '  '  , hl = plain }
	local sep3 = { str = '   ' , hl = plain }
	local sepcomp1 = { provider = ' '  , hl = plain }
	local sepcomp2 = { provider = '  ' , hl = plain }

	local mode_info = {
		['n'] = { 'NORMAL', colors.blue },
		['no'] = { 'N-PENDING', colors.blue },
		['i'] = { 'INSERT', colors.green },
		['ic'] = { 'INSERT', colors.green },
		['t'] = { 'TERMINAL', colors.green },
		['v'] = { 'VISUAL', colors.magenta },
		['V'] = { 'V-LINE', colors.magenta },
		[''] = { 'V-BLOCK', colors.magenta },
		['R'] = { 'REPLACE', colors.orange },
		['Rv'] = { 'V-REPLACE', colors.orange },
		['s'] = { 'SELECT', colors.yellow },
		['S'] = { 'S-LINE', colors.yellow },
		[''] = { 'S-BLOCK', colors.yellow },
		['c'] = { 'COMMAND', colors.red },
		['cv'] = { 'COMMAND', colors.red },
		['ce'] = { 'COMMAND', colors.red },
		['r'] = { 'PROMPT', colors.cyan },
		['rm'] = { 'MORE', colors.cyan },
		['r?'] = { 'CONFIRM', colors.cyan },
		['!'] = { 'SHELL', colors.green },
	}

	local c = {
		active = {},
		inactive = {},
	}

	-- left section
	table.insert(c.active, {}) -- left
	local left_sec = {
		{
			provider = '    ',
			hl = { fg = base['0'], bg = colors.blue },
		},
		sepcomp2,
		{
			provider = function()
				local fname = fn.expand '%:t'
				local ext = fn.expand '%:e'
				local icon = require('nvim-web-devicons').get_icon(fname, ext)
				if icon == nil then
					return ''
				end
				return icon .. ' ' .. fname
			end,
			hl = plain,
			right_sep = sep3,
		},
		{
			provider = function()
				local dir_name = fn.fnamemodify(fn.getcwd(), ':t')
				return ' ' .. dir_name
			end,
			hl = plain,
			right_sep = sep3,
		},
		{
			provider = 'git_diff_added',
			hl = plain,
			icon = ' ',
			right_sep = sep1,
		},
		{
			provider = 'git_diff_changed',
			hl = plain,
			icon = ' ',
			right_sep = sep1,
		},
		{
			provider = 'git_diff_removed',
			hl = plain,
			icon = ' ',
			right_sep = sep1,
		},
		{
			provider = 'diagnostic_errors',
			hl = { fg = colors.red, bg = base['1'] },
			icon = ' ',
			right_sep = sep1,
		},
		{
			provider = 'diagnostic_warnings',
			hl = { fg = colors.yellow, bg = base['1'] },
			icon = ' ',
			right_sep = sep1,
		},
		{
			provider = 'diagnostic_hints',
			hl = plain,
			icon = ' ',
			right_sep = sep1,
		},
		{
			provider = 'diagnostic_info',
			hl = plain,
			icon = ' ',
			right_sep = sep1,
		},
	}
	for _, component in ipairs(left_sec) do
		table.insert(c.active[1], component)
	end

	-- middle section
	table.insert(c.active, {}) -- middle
	local middle_sec = {}
	for _, component in ipairs(middle_sec) do
		table.insert(c.active[2], component)
	end

	-- right section
	table.insert(c.active, {}) -- right
	local right_sec = {
		{
			provider = function()
				if next(vim.lsp.buf_get_clients()) ~= nil then
					return '  LSP'
				else
					return ''
				end
			end,
			hl = plain,
			left_sep = sep1,
		},
		{
			provider = 'git_branch',
			hl = plain,
			left_sep = sep1,
		},
		{
			provider = 'position',
			hl = plain,
			left_sep = sep2,
		},
		{
			provider = function()
				return ' ' .. mode_info[fn.mode()][1] .. ' '
			end,
			hl = function()
				return { fg = base['0'], bg = mode_info[fn.mode()][2] }
			end,
			left_sep = sep2,
		}
	}
	for _, component in ipairs(right_sec) do
		table.insert(c.active[3], component)
	end

	require'feline'.setup {
		components = c
	}
end

return o
