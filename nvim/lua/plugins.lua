require("lazy").setup({
  "kyazdani42/nvim-web-devicons",
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("user.bufferline")
    end
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("user.telescope")
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      "neovim/nvim-lspconfig",          -- Required
      "mason-org/mason.nvim",           -- Optional
      "mason-org/mason-lspconfig.nvim", -- Optional

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
      "mfussenegger/nvim-jdtls"
    },
    config = function()
      require("user.lsp-config")
      require("user.cmp")
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
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup {
        settings = {
          tsserver_max_memory = 3072,
        }
      }
    end
  },
  {
    "sbdchd/neoformat",
    config = function()
      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      local fmt_group = augroup('FormatGroup', {})
      autocmd('BufWritePre', {
        group = fmt_group,
        pattern = "*.ts,*.tsx",
        callback = function()
          vim.cmd [[Neoformat prettierd]]
        end
      })
    end
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("user.harpoon")
    end
  },
  {
    'stevearc/oil.nvim',
    config = function()
      -- require("user.oil-config")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "JetBrainsMono Nerd Font Mono=34;Noto Color Emoji=34",
        theme = "Visual Studio Dark+",
        shadow_blur_radius = 25,
        to_clipboard = true,
        pad_horiz = 150,
        pad_vert = 120,
        output = function()
          return "/home/srikanth/Pictures/code/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
        end,
      })
    end
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        go = { "golangcilint" },
      }

      local golangcilint = require("lint.linters.golangcilint")
      golangcilint.append_fname = true
      golangcilint.args = {
        "run",
        "--out-format",
        "json",
        "--timeout",
        "5m",
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        tmux = { enabled = true }
      }
    }
  },
  {
    'srikanth-iyengar/competitive-programming.nvim',
    lazy = true,
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require("user.neorg")
    end,
  },
  {
    "zootedb0t/citruszest.nvim",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
    end
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  {
    "kaiuri/nvim-juliana",
    name = "sublime-theme",
    config = function()
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("user.dap")
    end
  },
  -- {
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --   build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  -- },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        level = vim.log.levels.INFO,
        timeout = 1000,
        max_width = nil,
        max_height = nil,
        stages = "fade",
        render = "default",
        background_colour = "NotifyBackground",
        on_open = nil,
        on_close = nil,
        minimum_width = 50,
        fps = 60,
        top_down = true,
        time_formats = {
          notification_history = "%FT%T",
          notification = "%T",
        },
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
    end
  },
  {
    'rdipardo/vim-cpywrite',
    opts = {},
    config = function()

    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end
  },
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate'
	}
})
