local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<Space>", "<Nop>", opts)

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
keymap("i", "<C-c>", "<esc>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("v", "<C-/>", ':Commentary<CR>', opts)
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
keymap("i", "<C-_>", "<cmd>Commentary<CR>", opts)

-- keymaps from vim script
-- keymap("n", "<leader>q", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader><leader>", ":noh<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<A-w>", "<cmd>bdelete<CR>", opts)
keymap("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

-- keymaps for cp
local function setup_cp()
	local km = vim.keymap.set
	km("n", ",tr", function()
		require('cp').run()
	end, opts)
	km("n", ",ti", function()
		require('cp').toggle_input()
	end, opts)
	km("n", ",to", function()
		require('cp').toggle_output()
	end, opts)
	km("n", ",te", function()
		require('cp').toggle_error()
	end, opts)
	km("n", ",fi", function()
		require('cp').focus_input()
	end, opts)
	km("n", ",fo", function()
		require('cp').focus_output()
	end, opts)
	km("n", ",fe", function()
		require('cp').focus_error()
	end, opts)
	km("n", "<A-a>", function()
		require('cp').hide_all()
	end, opts)
	km("n", "<A-t>", function()
		require('cp').setup()
	end, opts)
	km("n", "<A-d>", function()
		require('cp').destroy()
	end, opts)
	km("n", "<leader>i", function()
		require('cp').change_width(5)
	end, opts)
	km("n", "<leader>d", function()
		require('cp').change_width(-5)
	end, opts)
	km("n", ",cp", function()
		require('cp').change_buildsystem()
	end, opts)
	km("n", ",ec", function()
		require('cp').edit_config()
	end, opts)
end

setup_cp()

-- keymap to accept copilot suggestion
vim.keymap.set("i", "<C-a>", function()
	local copilot_keys = vim.fn["copilot#Accept"]()
	if copilot_keys ~= "" then
		vim.api.nvim_feedkeys(copilot_keys, "n", true)
	else
	end
end, opts)

vim.keymap.set("v", "<leader>sc", ":Silicon<CR>", opts)

-- Oil keymap
keymap("n", "-", "<CMD>Tex<CR>", { desc = "Open parent directory" })

-- Copywriter plugin
vim.keymap.set("n", "<leader>l", function()
		require("user.copywriter").license_picker()
	end,
	{
		desc = "Opens copywrite telescope popup"
	}
);
