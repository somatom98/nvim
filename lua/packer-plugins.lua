return require('packer').startup(function()
	--packer can manage itself
	use 'wbthomason/packer.nvim'

	--colorscheme
	use 'EdenEast/nightfox.nvim'
	use { "mangeshrex/everblush.vim" }

	use {
  		'kyazdani42/nvim-tree.lua',
  		requires = {
   	 		'kyazdani42/nvim-web-devicons', -- optional, for file icons
  		},
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use 'gpanders/editorconfig.nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- autocompletion framework
	use 'hrsh7th/cmp-nvim-lsp' -- LSP autocompletion provider
end)
