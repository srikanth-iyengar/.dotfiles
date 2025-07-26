local M = {}
local picker_present, pickers = pcall(require, "telescope.pickers")
local finder_present, finders = pcall(require, "telescope.finders")
local conf_present, conf = pcall(require, "telescope.config")
local actions_present, actions = pcall(require, "telescope.actions")
local action_state_present, action_state = pcall(require, "telescope.actions.state")
local notify_present, notify = pcall(require, "notify")

if not picker_present or not finder_present or not conf_present or not actions_present or not action_state_present or not notify_present then
	return M
end

conf = conf.values

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local licenses = {
	{
		name = "MIT",
		value = "MIT"
	},
	{
		name = "GPL v1",
		value = "GPL-1.0-only"
	},
	{
		name = "GPL v2",
		value = "GPL-2.0-only"
	},
	{
		name = "GPL v3",
		value = "GPL-3.0-only"
	}
}

local function write_copywrite_comments(license)
	vim.cmd("CPYwrite " .. license)
end

local function license_picker(opts)
	opts = opts or {}

	pickers.new(opts, {
		prompt_title = "Pick license",
		finder = finders.new_table {
			results = licenses,
			entry_maker = function(entry)
				print()
				return {
					value = entry.value,
					display = entry.name,
					ordinal = entry.value,
				}
			end
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local val = action_state.get_selected_entry().value
				notify("\t" .. val, vim.log.levels.INFO, {
					title = "Selected license for copywrite"
				})
				write_copywrite_comments(val)
			end)
			return true
		end
	}):find()
end

M.license_picker = license_picker

return M
