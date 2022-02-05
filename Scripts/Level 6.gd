extends "res://Scripts/Door movements.gd"


func _ready():
	if $"/root/Global".inventory.get_node("Item3").visible == true:
		for i in range(0,9):
			$Lighting.get_children()[i].color = "ffbd69"
	else:
		pass
	
