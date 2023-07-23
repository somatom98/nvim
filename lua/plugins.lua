return require('packer').startup(function(use)
	--packer can manage itself
	use 'wbthomason/packer.nvim'

	--colorscheme
	use 'EdenEast/nightfox.nvim'
	use { 'Everblush/nvim', as = 'everblush' }
	use {
		"neanias/everforest-nvim",
		config = function()
		  require("everforest").setup()
		end,
	}
	use "rebelot/kanagawa.nvim"

	use {
  		'kyazdani42/nvim-tree.lua',
  		requires = {
   	 		'kyazdani42/nvim-web-devicons',
  		},
  		tag = 'nightly'
	}

	use {
		'romgrk/barbar.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'nvim-tree/nvim-web-devicons',
			'lewis6991/gitsigns.nvim',
		}
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'gpanders/editorconfig.nvim'

	-- LSP
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use {
		'VonHeikemen/lsp-zero.nvim', 
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

	use {
		"folke/which-key.nvim",
		config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
		end
	}
end)
