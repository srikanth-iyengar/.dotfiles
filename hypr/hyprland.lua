hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "32")

require("lua.general")
require("lua.decoration")
require("lua.input")
require("lua.keybindings")
require("lua.misc")
require("lua.workspace")
require("lua.window_rule")
require("lua.startup")
