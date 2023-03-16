local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-c>" ,"<esc>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("v", "<C-/>", 'Commentary<CR>', opts)
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>dzz")
vim.keymap.set("n", "<C-u>", "<C-u>dzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<a-k>", ":move '<-2<cr>gv-gv", opts)
keymap("x", "<a-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<C-_>", ":Commentary<CR>", opts)
keymap("n", "<C-_>", ":Commentary<CR>", opts)

-- keymaps for cp
keymap("n", ",tr", ":lua require('cp').run()<CR>", opts)
keymap("n", ",ti", ":lua require('cp').toggle_input()<CR>", opts)
keymap("n", ",to", ":lua require('cp').toggle_output()<CR>", opts)
keymap("n", ",te", ":lua require('cp').toggle_error()<CR>", opts)
keymap("n", ",fi", ":lua require('cp').focus_input()<CR>", opts)
keymap("n", ",fo", ":lua require('cp').focus_output()<CR>", opts)
keymap("n", ",fe", ":lua require('cp').focus_error()<CR>", opts)
keymap("n", "<A-a>", ":lua require('cp').hide_all()<CR>", opts)
keymap("n", "<A-t>" ,":lua require('cp').setup()<CR>", opts)
keymap("n", "<A-d>", ":lua require('cp').destroy()<CR>", opts)
keymap("n", "<leader>i", ":lua require('cp').change_width(5)<CR>", opts)
keymap("n", "<leader>d", ":lua require('cp').change_width(-5)<CR>", opts)
keymap("n", ",cp", ":lua require('cp').change_buildsystem()<CR>", opts)


-- keymaps from vim script
keymap("n", "<leader>q", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>w", ":TagbarToggle<CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader><leader>", ":noh<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>c", ":bdelete!<CR>", opts)
keymap("n", "<leader>g", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<A-o>", ":lua require('jdtls').organize_imports()<CR>", opts)




-- LSP dianostics
keymap("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>vrn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("i", "<C-h>", ":lua vim.lsp.buf.signature_help()<CR>", opts)

-- Session manager
keymap("n", "<leader>3", ":SessionManager save_current_session<CR>", opts)
keymap("n", "<leader>2", ":SessionManager load_session<CR>", opts)
keymap("n", "<leader>1", ":SessionManager delete_session<CR>", opts)


--Terminal
-- keymap("n", "<A-i>", ":lua require('term_manager').setup()<CR>", opts)
-- keymap("n", "<A-1>", ":lua require('term_manager').toggle(1)<CR>", opts)
-- keymap("n", "<A-2>", ":lua require('term_manager').toggle(2)<CR>", opts)
-- keymap("n", "<A-3>", ":lua require('term_manager').toggle(3)<CR>", opts)
-- keymap("n", "<A-4>", ":lua require('term_manager').toggle(4)<CR>", opts)
-- keymap("x", "<A-1>", ":'<,'>FloatermSend --name=terminal1<CR>", opts)
-- keymap("x", "<A-2>", ":'<,'>FloatermSend --name=terminal2<CR>", opts)
-- keymap("x", "<A-3>", ":'<,'>FloatermSend --name=terminal3<CR>", opts)
-- keymap("x", "<A-4>", ":'<,'>FloatermSend --name=terminal4<CR>", opts)
-- keymap("n", "<leader>l1", ":%FloatermSend --name=terminal1<CR>", opts)
-- keymap("n", "<leader>l2", ":%FloatermSend --name=terminal1<CR>", opts)
-- keymap("n", "<leader>l3", ":%FloatermSend --name=terminal1<CR>", opts)
-- keymap("n", "<leader>l4", ":%FloatermSend --name=terminal1<CR>", opts)

