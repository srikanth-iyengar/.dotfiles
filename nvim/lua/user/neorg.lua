local present, orgmode = pcall(require, "orgmode")
if not present then
	return
end

-- Setup treesitter
require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { 'org' },
	},
	ensure_installed = {},
})

-- Setup orgmode
orgmode.setup({
	org_agenda_files = '~/orgfiles/agenda/**/*',
	org_default_notes_file = '~/orgfiles/refile.org',
	-- todo settings
	org_todo_keywords = { "TODO", "IN_PROGRESS", "PARKED", "DONE" },
	org_todo_keyword_faces = {
		TODO = ':background #000000 :foreground red',
		PROGRESS = ':forground orange :weight bold',
		DONE = ':foreground green :weight bold',
		PARKED = ":forground yellow :weight bold",
	},
	-- agenda_settings
	org_deadline_warning_days = 7,
	org_capture_template = { t = { description = "Task", template = "* TODO %?\n %U" } },
	mappings = {
		org = {
			org_todo = "<C-h>",
		}
	}
})
