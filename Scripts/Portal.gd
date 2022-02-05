extends "res://Scripts/Passage.gd"

func _ready():
	if $"/root/Global".inventory.get_node("Item11").visible == true:
		queue_free()
	if $"/root/Global".inventory.get_node("Item10").visible == true:
		self.visible = true
	else:
		self.visible = false
