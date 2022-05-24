local o = {}

o.config = function()
	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.on_server_ready(
		function(server)
			local opts = {}

			-- c/c++
			if server.name == 'clangd' then
				opts = {
					cmd = {'clangd', '--background-index'},
					filetypes = {'c', 'cc', 'cpp', 'objc', 'objcpp'}
				}
			end

			-- java
			if server.name == 'jdtls' then
				opts = {}
			end

			-- python
			if server.name == 'pyright' then
				opts = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								typeCheckingMode = 'off'
							},
							pythonPath='python'
						}
					}
				}
			end

			-- ruby
			if server.name == 'solargraph' then
				opts = {
					settings = {
						solargraph = {
							diagnostics = true
						}
					}
				}
			end

			server:setup(opts)
		end
	)
end

return o
