local present, telescope = pcall(require, "telescope")

if not present then
	return
end

vim.g.theme_switcher_loaded = true

local options = {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		file_ignore_patterns = { "node_modules", ".git/", "yarn.lock" },
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},
	pickers = {
		find_files = {
			previewer = false,
			theme = "dropdown",
		},
		git_files = {
			previewer = false,
			theme = "dropdown",
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}

telescope.load_extension("fzf")
telescope.setup(options)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ps",
	function()
		builtin.live_grep()
	end
)


vim.keymap.set("n", "<C-p>",
	builtin.git_files,
	{}
)


vim.keymap.set("n", "<A-p>",
	builtin.buffers,
	{}
)
