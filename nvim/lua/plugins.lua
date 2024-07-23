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
            local max_filesize = 10000 * 1024 -- 10000 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, disable = { 'ruby' } },
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
    "ThePrimeagen/harpoon",
    config = function()
      require("user.harpoon")
    end
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      -- vim.cmd [[colorscheme vscode]]
    end,
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup()
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
    "pwntester/octo.nvim",
    config = function()
      require "octo".setup()
    end
  },
  {
    'mrcjkb/rustaceanvim',
    config = function()

    end,
    version = "^4",
    lazy = false,
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
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        org_todo_keywords = { "TODO", "WAITING", "DELEGATED", "PROGRESS", "DONE", },
        org_todo_keyword_faces = {
          WAITING = ':background #010101 :forground yellow :weight bold',
          DELEGATED = ':background #FFFFFF :slant italic :underline on',
          TODO = ':background #000000 :foreground red',
          PROGRESS = ':forground orange :weight bold',
          DONE = ':foreground green :weight bold'
        },
        mappings = {
          org = {
            org_todo = "<C-h>",
          }
        }
      })

      -- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
      -- add `org` to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  {
    "nordtheme/vim",
    config = function()
      -- vim.cmd [[colorscheme nord]]
    end
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
      vim.cmd [[colorscheme gruvbox]]
    end
  }
})
