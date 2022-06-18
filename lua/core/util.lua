local o = {}

-- replace termcodes (for mappings)
o.t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- maps `lhs` to `rhs` for mode `mode`. if `mode` is '', applies to all modes.
-- can specify additional options (default: noremap, silent)
o.map = function(mode, lhs, rhs, opts)
	local options = {noremap = true, silent = true} -- default options
	options = vim.tbl_extend('force', options, opts or {})
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- returns whether the lsp for filetype `ft` is currently active
o.is_lsp_active_ft = function(ft)
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then return false end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, ft) ~= -1 then
			return true
		end
	end
	return false
end

-- returns whether an lsp (specified by name) is currently active
o.is_lsp_active_name = function(name)
	local clients = vim.lsp.get_active_clients()
	for _, client in pairs(clients) do
		if client.name == name then
			return true
		end
	end
	return false
end

o.read_file = function(file)
	local f = assert(io.open(file, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

return o
