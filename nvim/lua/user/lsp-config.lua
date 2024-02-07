local lsp = require("lsp-zero")

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
map("n", "<A-O>", function()
  if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact' then
    vim.cmd [[TSToolsOrganizeImports]]
  end
end)
map("n", "<leader>mi", function()
  if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact' then
    vim.cmd [[TSToolsAddMissingImports]]
  end
end)

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

lsp.set_preferences({
  sign_icons = {}
})

lsp.setup()
