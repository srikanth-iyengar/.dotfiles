local lsp = require("lsp-zero")
local fn = vim.fn

local function map(mode, l, r, opts)
  opts = opts or {}
  -- opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

local home_dir = os.getenv('HOME')

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
local function on_attach(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local ignoreFts = { "markdown", "java", "cpp", "c", "go", "rust" };
  local found = false
  for k, v in ipairs(ignoreFts) do
    if v == filetype then
      found = true
    end
  end
  if not found then
    lsp.buffer_autoformat()
  end
end

lsp.on_attach(on_attach)

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

require("mason").setup({
})
require("mason-lspconfig").setup({
  automatic_enable = true
})

vim.diagnostic.config({
  -- update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  virtual_text = true
})

local is_file_exist = function(path)
  local f = io.open(path, 'r')
  return f ~= nil and io.close(f)
end

local get_lombok_javaagent = function()
  local lombok_dir = home_dir .. '/.m2/repository/org/projectlombok/lombok/'
  local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r')
  if lombok_versions ~= nil then
    local lb_i, lb_versions = 0, {}
    for lb_version in lombok_versions:lines() do
      lb_i = lb_i + 1
      lb_versions[lb_i] = lb_version
    end
    lombok_versions:close()
    if next(lb_versions) ~= nil then
      local lombok_jar = fn.expand(string.format('%s%s/*.jar', lombok_dir, lb_versions[1]))
      if is_file_exist(lombok_jar) then
        return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
      end
    end
  end
  return ''
end

local notify = require("notify")


-- require("mason-lspconfig").setup_handlers {
--   -- The first entry (without a key) will be the default handler
--   -- and will be called for each installed server that doesn't have
--   -- a dedicated handler.
--   function(server_name) -- default handler (optional)
--     require("lspconfig")[server_name].setup {}
--   end,
--   -- Next, you can provide a dedicated handler for specific servers.
--   -- For example, a handler override for the `rust_analyzer`:
--   ['jdtls'] = function()
--     require('jdtls').setup_dap({ hotcodereplace = 'auto' })
--     require("lspconfig").jdtls.setup({
--       init_options = {
--         bundles = {
--           vim.fn.expand '$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'
--         }
--       }
--     })
--   end
-- }
