vim.opt.wrap=false

vim.opt.guicursor=""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true


vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.g.maplocalleader = " "



require 'plugins'
require "user.keymaps"
require "user.bufferline"
require "user.telescope"
require "user.cmp"
require "user.custom"
require "user.colorscheme"
require "user.gsigns"
require "user.lualine"
require "user.treesitter"
require "user.lsp-config"
require "user.noice"


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
require("mason").setup()
local nvim_lsp = require('lspconfig')
require("nvim-tree").setup()
