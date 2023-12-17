local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local installed, lga = pcall(require, "telescope-live-grep-args.actions")

if not installed then
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
  extensions = {
      fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
      },
      live_grep_args = {
        auto_quoting = true,
        mappings = {
            i = {
                ["<C-k>"] = lga.quote_prompt(),
                ["<C-i>"] = lga.quote_prompt({
                    postfix = " --iglob",
                }),
            }
        }
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
}

telescope.setup(options)

require('telescope').load_extension('fzf')
require("telescope").load_extension("live_grep_args")


local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ps",
function ()
  telescope.extensions.live_grep_args.live_grep_args()
end)


vim.keymap.set("n", "<C-p>",
    builtin.git_files,
    {}
)


vim.keymap.set("n", "<A-p>",
    builtin.buffers,
    {}
)
