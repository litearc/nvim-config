return require('packer').startup(
	function (use)

		-- some of these plugins like 'nvim-web-devicons' and 'plenary' are used by
		-- various plugins, so we just put them at the top instead of declaring them
		-- as dependencies for each plugin that uses them.
		use { 'wbthomason/packer.nvim' }
		use { 'antoinemadec/FixCursorHold.nvim' }
		use { 'kyazdani42/nvim-web-devicons' }
		use { 'nvim-lua/plenary.nvim' }
		use { 'MunifTanjim/nui.nvim' }
		use { 'godlygeek/tabular' }
		use { 'tpope/vim-fugitive' }

		-- better syntax highlighting (has other uses too)
		use {
			'nvim-treesitter/nvim-treesitter',
			config = function()
				require 'plug.treesitter'.config()
			end
		}

		-- shows signs next to lines added, changes, or deleted in git repos
		use {
			'lewis6991/gitsigns.nvim',
			config = function()
				require 'plug.gitsigns'.config()
			end,
		}

		-- very useful tool for searching through stuff
		use {
			'nvim-telescope/telescope.nvim',
			config = function()
				require 'plug.telescope'.config()
			end,
		}

		-- nice floating terminal
		use {
			'voldikss/vim-floaterm',
			config = function()
				require'plug.floaterm'.config()
			end,
		}

		-- shows tabs for open buffers
		use {
			'akinsho/bufferline.nvim',
			tag = "v2.*",
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require'plug.bufferline'.config()
			end,
		}

		-- easily comment/uncomment lines
		use {
			'numToStr/Comment.nvim',
			config = function()
				require'plug.comment'.config()
			end,
		}

		-- cool statusline plugin
		use {
			'feline-nvim/feline.nvim',
			config = function()
				require'plug.feline'.config()
			end,
		}

		-- sidebar treeview
		vim.g.neo_tree_remove_legacy_commands = 1
		use {
			'nvim-neo-tree/neo-tree.nvim',
			branch = 'v2.x',
			config = function()
				require'plug.neotree'.config()
			end
		}

		-- easily install lsp servers (ideally this shouldn't be done through nvim,
		-- but it's really convenient)
		use {
			'williamboman/nvim-lsp-installer',
			requires = { 'neovim/nvim-lspconfig' },
			config = function()
				require 'plug.lspservers'.config()
			end
		}

		-- nice lsp symbols in completion menus
		use {
			'onsails/lspkind-nvim',
			config = function()
				require'lspkind'.init {}
			end
		}

		-- completion for lsp (also other stuff like snippets)
		use { 'hrsh7th/cmp-nvim-lsp' }
		use { 'hrsh7th/cmp-buffer' }
		use { 'hrsh7th/cmp-path' }
		use { 'hrsh7th/cmp-cmdline' }
		use { 'hrsh7th/cmp-vsnip' }
		use { 'hrsh7th/vim-vsnip' }
		use {
			'hrsh7th/nvim-cmp',
			config = function()
				require'plug.cmp'.config()
			end
		}

		-- debug adapter protocol to debug code
		use {
			'mfussenegger/nvim-dap',
			config = function()
				require'plug.dap'.config()
			end
		}

		-- browse through code differences between commits, really useful
		use {
			'sindrets/diffview.nvim',
			config = function()
				require'plug.diffview'.config()
			end
		}

		-- like ranger, but purely in nvim
		use {
			'tamago324/lir.nvim',
			config = function()
				require'plug.lir'.config()
			end
		}

	end
)
