local colorscheme = require("user.colorscheme").transparent_background

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
  -- {
  -- 	"nvim-tree/nvim-tree.lua",
  -- 	config = function()
  -- 		require("nvim-tree").setup({
  -- 			diagnostics = {
  -- 				enable = true,
  -- 				show_on_dirs = true,
  -- 				show_on_open_dirs = true,
  -- 				debounce_delay = 50,
  -- 				severity = {
  -- 					min = vim.diagnostic.severity.ERROR,
  -- 					max = vim.diagnostic.severity.ERROR,
  -- 				},
  -- 				icons = {
  -- 					hint = "",
  -- 					info = "",
  -- 					warning = "",
  -- 					error = "",
  -- 				},
  -- 			},

  -- 		})
  -- 	end
  -- },
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
    "Mofiqul/vscode.nvim",
    config = function()
      -- vim.cmd [[colorscheme vscode]]
    end,
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require("user.oil-config")
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
  -- {
  --   "pwntester/octo.nvim",
  --   config = function()
  --     require "octo".setup()
  --     require "user.copywriter"
  --   end,
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "rcarriga/nvim-notify"
  --   }
  -- },
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
      require("user.neorg")
    end,
  },
  {
    "nordtheme/vim",
    config = function()
      vim.cmd[[colorscheme nord]]
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
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- {
  --   "TimUntersberger/neogit",
  --   cmd = "Neogit",
  --   config = function()
  --     require("neogit").setup({
  --       kind = "split", -- opens neogit in a split
  --       signs = {
  --         -- { CLOSED, OPENED }
  --         section = { "", "" },
  --         item = { "", "" },
  --         hunk = { "", "" },
  --       },
  --       integrations = { diffview = true }, -- adds integration with diffview.nvim
  --     })
  --   end,
  -- },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      -- colorscheme("rose-pine")
    end
  },
  {
    "kaiuri/nvim-juliana",
    name = "sublime-theme",
    config = function()
    end
  },
  {
    "luisiacc/gruvbox-baby",
    config = function()
      -- colorscheme("gruvbox-baby")
    end
  },
  {
    "diegoulloao/neofusion.nvim",
    config = function()
      -- vim.cmd [[colorscheme neofusion]];
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
    'Mofiqul/dracula.nvim',
    opts = {},
    config = function()
      -- vim.cmd [[colorscheme dracula]]
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "Shatur/neovim-ayu",
    config = function ()
      -- vim.cmd[[colorscheme gruvbox-baby]];
    end
  },
  {
    'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
    -- Activate when a file is created/opened
    event = { 'BufReadPre', 'BufNewFile' },
    -- Activate when a supported filetype is open
    ft = { 'go', 'javascript', 'python', 'ruby' },
    cond = function()
      -- Only activate if token is present in environment variable.
      -- Remove this line to use the interactive workflow.
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
    end,
    opts = {
      statusline = {
        -- Hook into the built-in statusline to indicate the status
        -- of the GitLab Duo Code Suggestions integration
        enabled = true,
      },
    },
    config = function ()
      require('gitlab').setup({
        statusline = {
          enabled = false
        },
        code_suggestions = {
          -- For the full list of default languages, see the 'auto_filetypes' array in
          -- https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim/-/blob/main/lua/gitlab/config/defaults.lua
          auto_filetypes = { 'ruby', 'javascript' }, -- Default is { 'ruby' }
          ghost_text = {
            enabled = false, -- ghost text is an experimental feature
            toggle_enabled = "<C-h>",
            accept_suggestion = "<C-l>",
            clear_suggestions = "<C-k>",
            stream = true,
          },
        }
      })
    end
  }
})
