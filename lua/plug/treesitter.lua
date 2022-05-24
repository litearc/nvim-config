local o = {}

o.config = function()
	require'nvim-treesitter.configs'.setup {
		ensure_installed = {
			'c',
			'cpp',
			'lua',
			'vim',
		},
		ignore_install = {},               -- list of parsers to ignore installing
		highlight = {
			enable = true,                   -- false will disable the whole extension
			disable = {},                    -- list of language that will be disabled
		},
	}
end

return o
