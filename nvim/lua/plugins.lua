-- Example using a list of specs with the default options
require("lazy").setup({
  "kyazdani42/nvim-web-devicons",
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("user.bufferline")
    end
  },
  { "nvim-lua/plenary.nvim", lazy = true },
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
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "java", "cpp", "python", "bash", "awk", "sql", "rust" },
        ignore_install = { "javascript" },
        sync_install = false,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
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
  "tpope/vim-fugitive",
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },

      })
    end
  },
  "MunifTanjim/nui.nvim",
  {
    "folke/noice.nvim",
    config = function()
      require("user.noice")
    end
  },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        variant = "moon"
      })
      -- vim.cmd [[colorscheme rose-pine]]
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup {
        settings = {
          tsserver_max_memory = 6144
        }
      }
    end
  },
  {
    "github/copilot.vim",
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
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/orgfiles/work",
                personal = "~/orgfiles/personal",
              },
              default_workspace = "personal",
            }
          },
        }
      }
    end,
  },
  {
    "luisiacc/gruvbox-baby",
    config = function()
    end
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("user.harpoon")
    end
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.cmd [[colorscheme vscode]]
    end
  }
})
