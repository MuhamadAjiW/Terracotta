extends TextureButton

func _ready():
	self.visible = false
	hide_marker()
	set_focus_mode(true)
	
func hide_marker():
	$marker.visible = false
func show_marker():
	$marker.visible = true

func show_text():
	var main = get_parent().get_parent().get_parent().get_parent()
	var title = get_parent().title
	var description = get_parent().description
	main.get_node("Itemdescription/CenterContainer/RichTextLabel").bbcode_text = title
	main.get_node("Itemdescription/VBoxContainer/Label").text = description
func hide_text():
	var main = get_parent().get_parent().get_parent().get_parent()
	main.get_node("Itemdescription/CenterContainer/RichTextLabel").bbcode_text = ""
	main.get_node("Itemdescription/VBoxContainer/Label").text = ""

func _on_interact_focus_entered():
	show_marker()

func _on_interact_focus_exited():
	hide_marker()
	self.visible = false
	hide_text()
	
func _on_interact_button_up():
	show_text()

