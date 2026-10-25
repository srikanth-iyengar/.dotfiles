local mainMod = "SUPER"
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "~/apps/flare/vicinae toggle"
local browser = "~/apps/zen/zen"

local function bindSuper(key, func)
	hl.bind(mainMod .. " + " .. key, func)
end

bindSuper("Q", hl.dsp.exec_cmd(terminal))
bindSuper("C", hl.dsp.window.close())
bindSuper("M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
bindSuper("E", hl.dsp.exec_cmd(fileManager))
bindSuper("V", hl.dsp.window.float({toggle = true}))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(menu))
bindSuper("P", hl.dsp.window.pseudo())

-- focus shortcuts
bindSuper("left", hl.dsp.focus({direction = "left"}) )
bindSuper("right", hl.dsp.focus({direction = "right"}) )
bindSuper("down", hl.dsp.focus({direction = "down"}) )
bindSuper("up", hl.dsp.focus({direction = "up"}) )

-- vim like movement
bindSuper("h", hl.dsp.focus({direction = "left"}) )
bindSuper("l", hl.dsp.focus({direction = "right"}) )
bindSuper("j", hl.dsp.focus({direction = "down"}) )
bindSuper("k", hl.dsp.focus({direction = "up"}) )

-- Workspace
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd("~/bin/chworkspace.sh " .. key))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

bindSuper("mouse_down", hl.dsp.focus({workspace="e+1"}) )
bindSuper("mouse_up", hl.dsp.focus({workspace="e-1"}) )

-- Move/resize windows with mainMod + LMB/RMB and dragging
bindSuper("mouse:272", hl.dsp.window.drag(),   { mouse = true })
bindSuper("mouse:273", hl.dsp.window.resize(), { mouse = true })


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%", { locked = true, repeating = true}))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%", { locked = true, repeating = true}))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", { locked = true, repeating = true}))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", { locked = true, repeating = true}))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+", { locked = true, repeating = true}))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-", { locked = true, repeating = true}))

hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("brightnessctl s +20"))
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("brightnessctl s 20-"))

bindSuper("SHIFT + S",  hl.dsp.exec_cmd("hyprshot -m region"))

bindSuper("B", hl.dsp.exec_cmd(browser))

