extends "res://Scripts/Passage.gd"

func _ready():
	if $"/root/Global".inventory.get_node("Item10").visible == true:
		self.visible = true
		$CollisionShape2D.disabled = false
	else:
		self.visible = false
		$CollisionShape2D.disabled = true
