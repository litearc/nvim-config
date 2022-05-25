local t = require'core.util'.t
local o = {}

local icons = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = 'ﰠ',
	Variable = '',
	Class = 'ﴯ',
	Interface = '',
	Module = '',
	Property = 'ﰠ',
	Unit = '塞',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = 'פּ',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

local function border(hl_name)
	return {
		{ '┌', hl_name },
		{ '─', hl_name },
		{ '┐', hl_name },
		{ '│', hl_name },
		{ '┘', hl_name },
		{ '─', hl_name },
		{ '└', hl_name },
		{ '│', hl_name },
	}
end

o.config = function()
	local cmp = require'cmp'
	cmp.setup {
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		formatting = {
			format = function(_, item)
				item.kind = string.format("%s %s", icons[item.kind], item.kind)
				return item
			end,
		},
		mapping = {
			['<tab>'] = cmp.mapping.select_next_item(),
			['<s-tab>'] = cmp.mapping.select_prev_item(),
		},
		window = {
			completion = { border = border 'CmpBorder' },
			documentation = { border = border 'CmpBorder' }
		},
   sources = {
      { name = 'nvim_lsp' },
			{ name = 'vsnip' },
   },
	}
end

return o
