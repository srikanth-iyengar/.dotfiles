local server = require("user.lsp_servers")
if server["java"] == nil then
    require("lspconfig").jdtls.setup{}
    vim.cmd[[LspStart<CR>]]
    server["java"] = true
end

