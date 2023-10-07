return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'akinsho/bufferline.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'ThePrimeagen/harpoon'
    use 'nvim-treesitter/nvim-treesitter'
	use 'tpope/vim-commentary'
	use 'L3MON4D3/LuaSnip'
	use "dstein64/vim-startuptime"
	use 'sainnhe/gruvbox-material'
	use { "srikanth-iyengar/competitive-programming.nvim", as = "cp" }
	use 'nvim-tree/nvim-tree.lua'
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
    use 'tpope/vim-fugitive'
    use 'Mofiqul/vscode.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'meuter/lualine-so-fancy.nvim'
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use 'nyoom-engineering/oxocarbon.nvim'
end)
