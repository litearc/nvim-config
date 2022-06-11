local o = {}

o.config = function()
	local dap = require('dap')

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
			name = "Launch file";
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

	cmd [[
		nnoremap <silent> <f5> <cmd>lua require'dap'.continue()<cr>
		nnoremap <silent> <f10> <cmd>lua require'dap'.step_over()<cr>
		nnoremap <silent> <f11> <cmd>lua require'dap'.step_into()<cr>
		nnoremap <silent> <f12> <cmd>lua require'dap'.step_out()<cr>
		nnoremap <silent> <leader>b <cmd>lua require'dap'.toggle_breakpoint()<cr>
		nnoremap <silent> <leader>B <cmd>lua require'dap'.set_breakpoint(vim.fn.input('breakpoint condition: '))<cr>
		nnoremap <silent> <leader>lp <cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('log point message: '))<cr>
		nnoremap <silent> <leader>dr <cmd>lua require'dap'.repl.open()<cr>
		nnoremap <silent> <f6> <cmd>lua require'dap'.repl.toggle()<cr>
		nnoremap <silent> <leader>dl <cmd>lua require'dap'.run_last()<cr>
	]]
end

return o
