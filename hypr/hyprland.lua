hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

local terminal = "alacritty"
local fileManager = "thunar"
local menu = "~/apps/flare/vicinae toggle"
local browser = "~/apps/zen/zen"

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "32")

local general = {
	gaps_in = 0,
	gaps_out = 0,
	border_size = 0,

	resize_on_border = false,

	allow_tearing = false,
	layout = "dwindle"
}

local decoration = {
	rounding = 0,
	rounding_power = 0,

	active_opacity = 1.0,
	inactive_opacity = 1.0,

	shadow = {
		enabled = false
	},

	blur = {
		enabled = false
	}
}

local input = {
	kb_layout = "us",
	kb_variant = "",
	kb_model = "",
	kb_options = "",
	kb_rules = "",

	follow_mouse = 1,
}

hl.config({
	input = input
})

hl.config({
	master = {
		new_status = "master"
	}
})
hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true
	}
})

hl.config({
	decoration = decoration
})

hl.config({
	general = general
})

hl.config({
	animations = {
		enabled = false
	}
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({toggle = true}))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- focus shortcuts
hl.bind(mainMod .. " + left", hl.dsp.focus({direction = "left"}) )
hl.bind(mainMod .. " + right", hl.dsp.focus({direction = "right"}) )
hl.bind(mainMod .. " + down", hl.dsp.focus({direction = "down"}) )
hl.bind(mainMod .. " + up", hl.dsp.focus({direction = "up"}) )

-- vim like movement
hl.bind(mainMod .. " + h", hl.dsp.focus({direction = "left"}) )
hl.bind(mainMod .. " + l", hl.dsp.focus({direction = "right"}) )
hl.bind(mainMod .. " + j", hl.dsp.focus({direction = "down"}) )
hl.bind(mainMod .. " + k", hl.dsp.focus({direction = "up"}) )

-- Workspace
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd("~/bin/chworkspace.sh " .. key))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({workspace="e+1"}) )
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({workspace="e-1"}) )

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%", { locked = true, repeating = true}))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%", { locked = true, repeating = true}))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", { locked = true, repeating = true}))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", { locked = true, repeating = true}))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+", { locked = true, repeating = true}))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-", { locked = true, repeating = true}))

hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("brightnessctl s +20"))
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("brightnessctl s 20-"))

hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))


hl.on("hyprland.start", function()
	hl.exec_cmd("sleep 1 && kanshi")

	hl.exec_cmd("$browser")
	hl.exec_cmd("sleep 2 && $terminal")

	hl.exec_cmd("sleep 3 && wlsunset")
	hl.exec_cmd("sleep 4 && eww -c $HOME/.config/eww --restart")
	hl.exec_cmd("sleep 5 && $HOME/bin/eww open --toggle dock-bar")
	hl.exec_cmd("bluetoothctl connect 40:F6:BC:81:6F:05")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("~/apps/flare/vicinae server")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 32")
end)

-- Monitor DP-1: workspaces 1-5
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })

-- Monitor HDMI-A-1: workspaces 6-10
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })


hl.window_rule({ match = { class = "^(zen)$" },       workspace = "2 silent" })
hl.window_rule({ match = { class = "^(Alacritty)$" }, workspace = "1 silent" })
hl.window_rule({ match = { class = "^(thunar)$" },    workspace = "6 silent" })
hl.window_rule({ match = { class = "^(Alacritty)$" }, no_blur = false })
