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
