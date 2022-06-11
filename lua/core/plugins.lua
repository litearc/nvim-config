return require('packer').startup(
	function (use)

		use { 'wbthomason/packer.nvim' }
		use { 'antoinemadec/FixCursorHold.nvim' }
		use { 'kyazdani42/nvim-web-devicons' }
		use { 'nvim-lua/plenary.nvim' }
		use { 'MunifTanjim/nui.nvim' }
    use { 'godlygeek/tabular' }

    use {
			'nvim-treesitter/nvim-treesitter',
			config = function()
				require 'plug.treesitter'.config()
			end
		}

		use {
			'lewis6991/gitsigns.nvim',
			config = function()
				require 'plug.gitsigns'.config()
			end,
		}

		use {
			'nvim-telescope/telescope.nvim',
			config = function()
				require 'plug.telescope'.config()
			end,
		}

		use {
			'voldikss/vim-floaterm',
			config = function()
				require'plug.floaterm'.config()
			end,
		}

		use {
			'akinsho/bufferline.nvim',
			tag = "v2.*",
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require'plug.bufferline'.config()
			end,
		}

		use {
			'numToStr/Comment.nvim',
			config = function()
				require'plug.comment'.config()
			end,
		}

		use {
			'feline-nvim/feline.nvim',
			config = function()
				require'plug.feline'.config()
			end,
		}

		vim.g.neo_tree_remove_legacy_commands = 1
		use {
			'nvim-neo-tree/neo-tree.nvim',
			branch = 'v2.x',
			config = function()
				require'plug.neotree'.config()
			end
		}

		use {
			'williamboman/nvim-lsp-installer',
			requires = { 'neovim/nvim-lspconfig' },
			config = function()
				require 'plug.lspservers'.config()
			end
		}

		use {
			'onsails/lspkind-nvim',
			config = function()
				require'lspkind'.init {}
			end
		}

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

		use { 'tpope/vim-fugitive' }

		use {
			'mfussenegger/nvim-dap',
			config = function()
				require'plug.dap'.config()
			end
		}

	end
)
