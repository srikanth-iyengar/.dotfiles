local async = require("plenary.async")
local notify = require("notify").async

require("notify").setup({
  background_colour = "Normal",
  fps = 60,
  icons = {
  DEBUG = "",
  ERROR = "",
  INFO = "",
  TRACE = "✎",
  WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade",
  timeout = 5000,
  top_down = true
})

async.run(function()
  notify("Neovim Loaded successfully", "info", {
      title = "Neovim",
      style = "fade"
    })
end)
