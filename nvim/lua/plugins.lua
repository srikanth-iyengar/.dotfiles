-- Example using a list of specs with the default options
require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  "kyazdani42/nvim-web-devicons",
  {
    "akinsho/bufferline.nvim",
    config = function()
        require("user.bufferline")
    end
  },
  {"nvim-lua/plenary.nvim", lazy = true},
  {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("user.telescope")
        end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "c", "lua", "vim", "java", "javascript", "typescript", "go"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
      })
    end
  },
  "williamboman/mason.nvim",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
			"neovim/nvim-lspconfig",             -- Required
			"williamboman/mason.nvim",           -- Optional
			"williamboman/mason-lspconfig.nvim", -- Optional

			-- Autocompletion
			"hrsh7th/nvim-cmp",         -- Required
			"hrsh7th/cmp-nvim-lsp",     -- Required
			"hrsh7th/cmp-buffer",       -- Optional
			"hrsh7th/cmp-path",         -- Optional
			"saadparwaiz1/cmp_luasnip", -- Optional
			"hrsh7th/cmp-nvim-lua",     -- Optional

			-- Snippets
			"L3MON4D3/LuaSnip",             -- Required
			"rafamadriz/friendly-snippets", -- Optional
    },
    config = function()
      require("user.lsp-config")
    end
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      -- vim.cmd[[colorscheme vscode]]
    end
  },
  {
    "navarasu/onedark.nvim",
    config = function()
            -- Lua
        require("onedark").setup({
            style = "cool",
        })
        require("onedark").load()
    end
  },
  {
      "lewis6991/gitsigns.nvim",
      config = function()
          require("user.gsigns")
      end
  },
  {
      "nvim-lualine/lualine.nvim",
      config = function()
          require("user.lualine")
      end
  },
  "meuter/lualine-so-fancy.nvim",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  {
      "nvim-tree/nvim-tree.lua",
      config = function()
          require("nvim-tree").setup()
      end
  },
  "MunifTanjim/nui.nvim",
  {
    "folke/noice.nvim",
    config = function()
        require("user.noice")
    end
  },
})
