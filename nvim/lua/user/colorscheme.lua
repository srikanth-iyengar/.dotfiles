
local function transparent_background()
    color = "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- transparent_background()
--
vim.cmd[[ colorscheme rose-pine ]]
