local dap = require("dap")
local ui = require("dapui")

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint);
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor);

-- Eval var under cursor
vim.keymap.set("n", "<leader>?", function()
	require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue);
vim.keymap.set("n", "<F2>", dap.step_into);
vim.keymap.set("n", "<F3>", dap.step_over);
vim.keymap.set("n", "<F4>", dap.step_out);
vim.keymap.set("n", "<F4>", dap.step_back);
vim.keymap.set("n", "<F10>", dap.restart);

ui.setup(
	{
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = ""
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.9
					},
					{
						id = "watches",
						size = 0.1
					}
				},
				position = "bottom",
				size = 10
			}
		},
		mappings = {
			edit = "e",
			expand = {
				"<CR>", "<2-LeftMouse>"
			},
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 100
		}
	}
)

-- auto open ui
dap.listeners.before.attach.dapui_config = function()
	ui.open()
end

dap.listeners.before.launch.dapui_config = function()
	ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

