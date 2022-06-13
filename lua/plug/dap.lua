local read_file = require'core.util'.read_file
local o = {}

o.config = function()
	local dap = require'dap'

	-- adapter configuration
	dap.adapters.python = {
		type = 'executable';
		command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python';
		args = { '-m', 'debugpy.adapter' };
	}

	-- debugee configuration
	dap.configurations.python = {
		{
			type = 'python';
			request = 'launch';
			name = "Launch file (generic config)";
			program = "${file}";
			pythonPath = function()
				return '/usr/bin/python3'
			end;
		},
	}

	fn.sign_define('DapBreakpoint'          , {text='●' , texthl='DiagnosticSignError' , linehl='' , numhl=''})
	fn.sign_define('DapBreakpointCondition' , {text='●' , texthl='DiagnosticSignHint'  , linehl='' , numhl=''})
	fn.sign_define('DapLogPoint'            , {text='' , texthl='DiagnosticSignInfo'  , linehl='' , numhl=''})
	fn.sign_define('DapStopped'             , {text='' , texthl='DiagnosticSignWarn'  , linehl='' , numhl=''})
	fn.sign_define('DapBreakpointRejected'  , {text='' , texthl='DiagnosticSignError' , linehl='' , numhl=''})

	vim.keymap.set('n', '<f5>',
		function()
			-- check if cwd has launch.json file. if so, add it to the dap config
			local path = vim.fn.getcwd() .. '/.vscode/launch.json'
			if vim.loop.fs_stat(path) then
				local text = read_file(path)
				local json = vim.fn.json_decode(text)
				local name = json.configurations[1].name
				local type = json.configurations[1].type
				-- check if config name is already in dap config. if so, don't add.
				-- if we do, the list will contain duplicate configs.
				local in_tbl = false
				for i, v in ipairs(dap.configurations[type]) do
					if v.name == name then
						in_tbl = true
						break
					end
				end
				if not in_tbl then
					require'dap.ext.vscode'.load_launchjs(nil)
				end
			end
			-- start debugger
			dap.continue()
		end
	)

	vim.keymap.set('n', '<f10>', dap.step_over)
	vim.keymap.set('n', '<f11>', dap.step_into)
	vim.keymap.set('n', '<f12>', dap.step_out)
	vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
	vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('breakpoint condition: ')) end)
	vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('breakpoint condition: ')) end)
	vim.keymap.set('n', '<leader>dr', dap.repl.open)
	vim.keymap.set('n', '<f6>', dap.repl.toggle)
	vim.keymap.set('n', '<leader>dl', dap.run_last)

end

return o
