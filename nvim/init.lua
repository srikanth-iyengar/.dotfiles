require 'plugins'
require "user.keymaps"
require "user.bufferline"
require "user.customls"
require "user.keymaps"
require "user.floatterm"
require "user.lualine"
require "user.telescope"
-- require "user.lsp"
require "user.cmp"
require "user.colorscheme"
require "user.harpoon"
require "user.custom"
require("mason").setup()

vim.opt.guicursor=""
vim.opt.smartindent=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.wrap=false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff=10
vim.opt.signcolumn="yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime=50
vim.opt.colorcolumn = "85"
vim.cmd("silent set mouse-=a")
vim.opt.expandtab=true
vim.opt.rnu = true
vim.opt.nu = true

local status_ok, alpha = pcall(require, "alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e C:/Users/Dell/AppData/Local/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    dashboard.button("s", "  Session Manager", ":SessionManager load_session<CR>"),
}

local function footer()
    return "Do The Simplest Thing That Could Possibly Work"
end
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

require'nvim-treesitter.configs'.setup {
    sync_install = false,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
local Path = require('plenary.path')
require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        path_replacer = '__', -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
            'gitcommit',
        }, 
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
    })
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
Map("n", "<leader>b", ":lua require(\"user.buildscript\").compileAndRun() <CR>")

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
vim.cmd[[ set autoread ]]

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if status_ok then
    local lspconfig = require("lspconfig")
    local servers = {"jsonls", 
        "lua_ls", "pylsp", "sqlls",
        "kotlin_language_server",
        "dockerls", "groovyls", "jdtls"
    }
    lsp_installer.setup {
        ensure_installed = servers
    }
end
require("lspconfig").jsonls.setup{}
require("lspconfig").lua_ls.setup{}
require("lspconfig").pyright.setup{}
require("lspconfig").dockerls.setup{}
require("lspconfig").groovyls.setup{}
require("lspconfig").sqlls.setup{}
require("lspconfig").jdtls.setup{}
require("lspconfig").yamlls.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").tflint.setup{}





require("nvim-tree").setup()


require("yaml-companion").setup({
  builtin_matchers = {
    kubernetes = { enabled = true },
    cloud_init = { enabled = true }
  },

  schemas = {
    result = {
    },
  },

  lspconfig = {
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        validate = true,
        format = { enable = true },
        hover = true,
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemaDownload = { enable = true },
        schemas = {},
        trace = { server = "debug" },
      },
    },
  },
})

vim.opt.mouse = ""
