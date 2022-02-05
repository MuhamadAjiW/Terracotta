extends "res://Scripts/Passage.gd"

func _ready():
	if $"/root/Global".inventory.get_node("Item2").visible == true and $"/root/Global".inventory.get_node("Item4").visible == true:
		self.visible = true
		$CollisionShape2D.disabled = false
	else:
		self.visible = false
		$CollisionShape2D.disabled = true
