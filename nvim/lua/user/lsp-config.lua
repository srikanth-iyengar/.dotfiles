local lsp = require("lsp-zero")

-- lsp.on_attach(function(client, bufnr)

local function map(mode, l, r, opts)
  opts = opts or {}
  -- opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end
map("n", "gd", function() vim.lsp.buf.definition() end)
map("n", "gD", function() vim.lsp.buf.declaration() end)
map("n", "gr", function() vim.lsp.buf.references() end)
map("n", "K", function() vim.lsp.buf.hover() end)
map("n", "gi", function() vim.lsp.buf.implementation() end)
map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
map("n", "gl", function() vim.diagnostic.open_float() end)
map("n", "[d", function() vim.diagnostic.goto_next() end)
map("n", "]d", function() vim.diagnostic.goto_prev() end)
map("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
map("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
map("i", "<C-h>", function() vim.lsp.buf.signature_help() end)

-- end)

lsp.on_attach(function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local ignoreFts = { "markdown", "typescript", "typescriptreact", "java" };
  local found = false
  for k, v in ipairs(ignoreFts) do
    if v == filetype then
      found = true
    end
  end
  if not found then
    lsp.buffer_autoformat()
  end
end)

lsp.preset('recommended')
lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['gopls'] = { 'go' },
  }
})

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

-- lsp.set_sign_icons({
--   error = '✘',
--   warn = '▲',
--   hint = '⚑',
--   info = '»'
-- })

lsp.set_preferences({
  sign_icons = {}
})



lsp.setup()
require("lspconfig").tsserver.setup({
  initializationOptions = {
    maxTsServerMemory = 8000,
    preferences = {
      allowIncompleteCompletions = true,
      allowRenameOfImportPath = true,
    },
  },
})
