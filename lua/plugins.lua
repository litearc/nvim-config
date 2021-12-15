local cmd = vim.cmd
cmd 'packadd packer.nvim'

return require'packer'.startup(
  function(use)
    use 'wbthomason/packer.nvim'

    -- comment in files w multiple langs
    use {
      'JoosepAlviste/nvim-ts-context-commentstring',
      ft = {'vue', 'svelte'}
    }

    -- html
    use {
      'mattn/emmet-vim',        -- easily create tags
      ft = 'html'
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      config = function()
        require 'plug.telescope'.setup()
      end,
      setup = function()
        require 'plug.telescope'.maps()
      end
    }

    -- treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require 'plug.treesitter'.setup()
      end,
      setup = function()
        require 'plug.treesitter'.maps()
      end
    }

    -- fast fuzzy finder
    use { 'junegunn/fzf', run = 'fzf#install()' }
    use {
      'junegunn/fzf.vim',
      config = function()
        require'plug.fzf'.setup()
      end,
      setup = function()
        require'plug.fzf'.maps()
      end
    }

    -- floaterm
    use {
      'voldikss/vim-floaterm',
      config = function()
        require'plug.floaterm'.setup()
      end,
      setup = function()
        require'plug.floaterm'.maps()
      end
    }

    -- bufferline
    use {
      'akinsho/nvim-bufferline.lua',
      config = function()
        require'plug.bufferline'.setup()
      end,
      setup = function()
        require'plug.bufferline'.maps()
      end
    }

    -- icons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require'plug.icons'.setup()
      end
    }

    -- -- sidebar file tree
    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require'plug.nvimtree'.setup()
      end,
      setup = function()
        require'plug.nvimtree'.maps()
      end
    }

    -- statusline
    use {
      'glepnir/galaxyline.nvim',
      config = function()
        require'plug.galaxyline'.setup()
      end
    }

    -- lsp stuff
    use {
      'williamboman/nvim-lsp-installer',
      requires = { 'neovim/nvim-lspconfig' },
      config = function()
        require 'plug.lspservers'
      end
    }
    use {
      'onsails/lspkind-nvim',
      config = function()
        require'lspkind'.init{}
      end
    }

    -- arguments
    use 'AndrewRadev/sideways.vim' -- jump to next/prev argument
    use 'wellle/targets.vim' -- additional targets, e.g. arguments

    -- git
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'plug.gitsigns'.setup()
      end,
      setup = function()
        require 'plug.gitsigns'.maps()
      end
    }
    use 'tpope/vim-fugitive'

    -- (un)comment
    use {
      'terrortylor/nvim-comment',
      config = function()
        require'plug.comment'.setup()
      end,
      setup = function()
        require'plug.comment'.maps()
      end
    }

    -- visual multiple-selection
    use {
      'mg979/vim-visual-multi',
      config = function()
        require 'plug.visualmulti'
      end
    }

    -- extends vim's brace matching
    use {
      'andymass/vim-matchup',
      config = function()
        require 'plug.matchup'
      end
    }

    -- sidebar with code symbols
    use {
      'liuchengxu/vista.vim',
      config = function()
        require'plug.vista'.setup()
      end,
      setup = function()
        require'plug.vista'.maps()
      end
    }

    -- completion menu. TODO: deprecated, use nvim-cmp when stable
    use {
      'hrsh7th/nvim-compe',
      setup = function()
        require'plug.compe'.maps()
      end
    }

    -- trouble
    use {
      'folke/trouble.nvim',
      config = function()
        require'plug.trouble'.setup()
      end,
      setup = function()
        require'plug.trouble'.maps()
      end
    }

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- misc
    use 'nvim-lua/popup.nvim'
    use 'ludovicchabant/vim-gutentags'
    use 'godlygeek/tabular'
    use 'nvim-lua/plenary.nvim'
    use 'tweekmonster/startuptime.vim'
    use 'wincent/terminus'
  end
)
