extends TextureButton

export(String) var title = "[center] Item one [/center]"
export(String) var description = "Ini deskripsi item"

func _ready():
	hide_marker()
	set_focus_mode(true)
	
func hide_marker():
	$marker.visible = false
func show_marker():
	$marker.visible = true

func _on_Item1_focus_entered():
	show_marker()

func _on_Item1_focus_exited():
	hide_marker()

func _on_Item1_button_up():
	$interact.visible = true
	$interact.grab_focus()
