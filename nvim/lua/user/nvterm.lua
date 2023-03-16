local status, nvterm = pcall(require, "nvterm")

if not status then
  print("nvterm is not installed")
end


require("nvterm").setup({
  terminals = {
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "double",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .43 },
    },
    cmd="pwsh"
  },
})

-- local term = require("nvterm.terminal").new({cmd="pwsh", hidden=true})
-- print(term)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<A-1>", function () require("nvterm.terminal").toggle('float') end  , opts)
vim.keymap.set("n", "<A-2>", function () require("nvterm.terminal").toggle('vertical') end  , opts)
vim.keymap.set("t", "<A-1>", function () require("nvterm.terminal").toggle('float') end  , opts)
vim.keymap.set("t", "<A-2>", function () require("nvterm.terminal").toggle('vertical') end  , opts)
