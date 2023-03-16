local function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map("n", "tl", "<Cmd>")
-- Map("n", "<A-T>", "<Cmd>FloatermNew --height=0.9 --width=0.9 --wintype=float --name=floaterm1 pwsh<CR>")
-- Map("n", "<A-1>", "<Cmd>FloatermToggle<CR>")
