local M = {}

M.direction = "float"
M.terminals = {}
M.isopen = nil

function M.setup()
  for i = 1, 4, 1 do
    if M.terminals[i] == nil then
      M.terminals[i] = {name="terminal" .. tostring(i), open=false, position="float"}
      vim.cmd("silent FloatermNew --height=0.9 --width=0.9 --wintype=" .. M.terminals[i]["position"] .. " --name=" .. M.terminals[i]["name"] .. " pwsh")
    end
  end
  vim.cmd[[FloatermHide]]
end

function M.change_to_vertical()
  for i = 1, 4, 1 do
    vim.cmd("silent FloatermUpdate --width=0.5 --height=0.95")
    vim.cmd("silent FloatermUpdate --position=right")
  end
end

function M.change_to_float()
  for i = 1, 4, 1 do
    vim.cmd("silent FloatermUpdate --position=float --width=0.9 --height=0.9 --name=" .. M.terminals[i]["name"])
  end
end

function M.toggle(num)
  if M.isopen == nil then
    M.setup()
  end
  if not M.terminals.isopen then
    vim.cmd("silent FloatermShow " .. "terminal" .. tostring(num))
    M.terminals.isopen = true
    return
  end
  vim.cmd[[FloatermHide]]
  M.terminals.isopen = false
end

function M.send(num)
  vim.cmd("'<'>FloatermSend --name=" .. "terminal" .. tostring(num) )
end

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 'n', "<ENTER>", "<C-w>w",opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>vv", ":lua require('term_manager').change_to_vertical()<CR>", opts)
vim.keymap.set("n", "<leader>th", ":lua require('term_manager').change_to_float()<CR>", opts)

return M
