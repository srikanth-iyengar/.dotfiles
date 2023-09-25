require 'plugins'
require "user.keymaps"
require "user.bufferline"
require "user.telescope"
require "user.cmp"
require "user.custom"
require "user.colorscheme"
require "user.gitsigns"
require "user.lualine"
-- require "user.octo"
require "user.formatter"
require "user.treesitter"

vim.opt.guicursor=""
vim.opt.smartindent=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.wrap=false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff=5
vim.opt.signcolumn="yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime=50
vim.opt.colorcolumn = "85"
vim.cmd("silent set mouse-=a")
vim.opt.expandtab=true
vim.opt.rnu = true
vim.opt.nu = true

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if status_ok then
    local servers = {
        "jsonls",
        "lua_ls",
        "pylsp",
        "sqlls",
        "kotlin_language_server",
        "dockerls",
        "jdtls"
    }
    lsp_installer.setup {
        ensure_installed = servers
    }
end
require("nvim-tree").setup()
vim.opt.mouse = ""
require("mason").setup()
local nvim_lsp = require('lspconfig')
-- nvim_lsp.denols.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }

-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
--   single_file_support = false
-- }


