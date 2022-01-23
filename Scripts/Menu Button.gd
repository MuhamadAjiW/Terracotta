tool
extends TextureButton

export(String) var text = "Button 1"
export(int) var margin_from_center = 50

func setup_text():
	$RichTextLabel.bbcode_text = "[center] %s [/center]" % [text]

func hide_marker():
	for marker in [$LeftMarker, $RightMarker]:
		marker.visible = false

func show_marker():
	for marker in [$LeftMarker, $RightMarker]:
		marker.visible = true
		marker.global_position.y = rect_global_position.y + rect_size.y/2
	$LeftMarker.global_position.x = rect_global_position.x + rect_size.x/2 - margin_from_center
	$RightMarker.global_position.x = rect_global_position.x + rect_size.x/2 + margin_from_center

func _ready():
	setup_text()
	hide_marker()
	set_focus_mode(true)

func _process(delta):
	if Engine.editor_hint:
		setup_text()
		show_marker()


func _on_Menu_Button_focus_entered():
	show_marker()

func _on_Menu_Button_focus_exited():
	hide_marker()
