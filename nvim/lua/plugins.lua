-- require "user.toggleterm"im.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- use 'goolord/alpha-nvim'
	-- use 'tpope/vim-surround'
	-- use 'mhinz/vim-signify'
	-- use 'Yggdroot/indentLine'
	-- use 'sheerun/vim-polyglot'
	use 'kyazdani42/nvim-web-devicons'
	use 'akinsho/bufferline.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	-- use 'hrsh7th/nvim-compe'
	use 'ThePrimeagen/harpoon'
	-- use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
	-- use 'Shatur/neovim-session-manager'
	-- use 'nvim-telescope/telescope-ui-select.nvim'
	use 'tpope/vim-commentary'
	use 'L3MON4D3/LuaSnip'

	use "dstein64/vim-startuptime"
	-- use 'mbbill/undotree'

	use 'sainnhe/gruvbox-material'

	-- nvim jdtls

	-- use "neovim/nvim-lspconfig" -- enable LSP
	-- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	-- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "hrsh7th/cmp-nvim-lsp"


	-- use 'voldikss/vim-floaterm'
	-- use 'ThePrimeagen/vim-be-good'
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
	-- use "rose-pine/neovim"
    use "tpope/vim-fugitive"
    -- Packer:
    use 'Mofiqul/vscode.nvim'-- use "mbbill/undotree"

    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'meuter/lualine-so-fancy.nvim'
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use 'nyoom-engineering/oxocarbon.nvim'
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function ()
            require"octo".setup()
        end
    }
    use 'mhartington/formatter.nvim'
    use 'Dhanus3133/Leetbuddy.nvim'
    use 'projekt0n/caret.nvim'
end)
