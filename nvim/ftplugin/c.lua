local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local on_save_c_group = augroup("OnSaveCGroup", {})
local on_save_h_group = augroup("OnSaveHGroup", {})
local rules = " -linux "

local notify = require("notify")

autocmd('BufWritePost', {
	group = on_save_c_group,
	pattern = "*.c",
	callback = function()
		local current_file = vim.api.nvim_buf_get_name(0)
		io.popen("indent" .. rules .. current_file .. " 2>&1 1>/dev/null")
	end
})

autocmd('BufWritePost', {
	group = on_save_h_group,
	pattern = "*.h",
	callback = function()
		local current_file = vim.api.nvim_buf_get_name(0)
		io.popen("indent" .. rules .. current_file .. " 2>&1 1>/dev/null")
	end
})
