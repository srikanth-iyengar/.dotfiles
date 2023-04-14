-- require "user.toggleterm"im.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'goolord/alpha-nvim'
	use 'tpope/vim-surround'
	use 'mhinz/vim-signify'
	use 'Yggdroot/indentLine'
	use 'sheerun/vim-polyglot'
	use 'kyazdani42/nvim-web-devicons'
	use 'akinsho/bufferline.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'hrsh7th/nvim-compe'
	use 'ThePrimeagen/harpoon'
	use 'nvim-treesitter/nvim-treesitter'
	use 'ryanoasis/vim-devicons'
	use 'nvim-lualine/lualine.nvim'
	-- use 'Shatur/neovim-session-manager'
	use 'nvim-telescope/telescope-ui-select.nvim'
	use 'tpope/vim-commentary'
	use 'L3MON4D3/LuaSnip'

	use "dstein64/vim-startuptime"
	use 'mbbill/undotree'

	use 'sainnhe/gruvbox-material'

	-- nvim jdtls

	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"


	use 'voldikss/vim-floaterm'
	use 'ThePrimeagen/vim-be-good'
	use { "srikanth-iyengar/competitive-programming.nvim", as = "cp" }
	use 'nvim-tree/nvim-tree.lua'
	use {
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	}

	use "williamboman/mason.nvim"
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
	use "rose-pine/neovim"
	use 'Mofiqul/dracula.nvim'
end)
