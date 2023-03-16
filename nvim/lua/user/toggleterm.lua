local terminal_array = {}
local terminal_config = { direction = "float" }
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-m>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 3,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })


for i=1,9 do
    terminal_array[i] = Terminal:new({cmd="pwsh", hidden=true, direction = terminal_config["direction"]})
end

function _POWERSHELL_I_TOGGLE(i) 
    terminal_array[i]:toggle()
end

terminal_array[4] = Terminal:new({cmd="pwsh", hidden=true})
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua _POWERSHELL_I_TOGGLE(1)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>lua _POWERSHELL_I_TOGGLE(2)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>lua _POWERSHELL_I_TOGGLE(3)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-4>", "<cmd>lua _LAZYGIT_TOGGLE(4)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-5>", "<cmd>lua _POWERSHELL_I_TOGGLE(5)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-6>", "<cmd>lua _POWERSHELL_I_TOGGLE(6)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-7>", "<cmd>lua _POWERSHELL_I_TOGGLE(7)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-8>", "<cmd>lua _POWERSHELL_I_TOGGLE(8)<CR>", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<A-9>", "<cmd>lua _POWERSHELL_I_TOGGLE(9)<CR>", {noremap = true, silent=true})
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
    node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
    ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end

local powershell = Terminal:new({ cmd = "wsl -d debian", hidden = true })
function _POWERSHELL_TOGGLE()
    powershell:toggle()
end

local pwsh = Terminal:new({cmd = "pwsh", hidden = true})
function _PWSH_TOGGLE()
    pwsh:toggle()
end

vim.api.nvim_set_keymap("n", "<A-m>", "<cmd>lua _POWERSHELL_TOGGLE()<CR>", {noremap = true, silent = true} )


function TerminalVertical() 
    terminal_config["direction"] = "vertical"
    for i=1,9 do
        terminal_array[i]["direction"] = terminal_config["direction"]
    end
end
function TerminalTab() 
    terminal_config["direction"] = "tab"
    for i=1,9 do
        terminal_array[i]["direction"] = terminal_config["direction"]
    end
end
function TerminalFloat() 
    terminal_config["direction"] = "float"
    for i=1,9 do
        terminal_array[i]["direction"] = terminal_config["direction"]
    end
end
function TerminalHorizontal() 
    terminal_config["direction"] = "horizontal"
    for i=1,9 do
        terminal_array[i]["direction"] = terminal_config["direction"]
    end
end

-- map("n", "jkv", ":lua terminalVertical()<CR>")
-- map("n", "jkh", ":lua terminalHorizontal()<CR>")
-- map("n", "jkt", ":lua terminalTab()<CR>")
-- map("n", "jkf", ":lua terminalFloat()<CR>")
