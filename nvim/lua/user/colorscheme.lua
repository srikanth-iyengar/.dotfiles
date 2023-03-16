vim.cmd [[
try
    colorscheme gruvbox-material
    set background=dark
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_better_performance = 1
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]]


local function transparent_background()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
