extends "res://Scripts/Passage.gd"

func _input(event):
	if $"/root/Global".inventory.get_node("Item3").visible == true:
		path = "res://Scenes/Level 8.tscn"
	else:
		path = "res://Scenes/Level 5.tscn"
	
