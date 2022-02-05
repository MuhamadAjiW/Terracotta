extends "res://Scripts/Passage.gd"

func _input(event):
	if $"/root/Global".inventory.get_node("Item2").visible == true:
		path = "res://Scenes/Level 5.tscn"
	else:
		path = "res://Scenes/Level 3.tscn"
	
	
