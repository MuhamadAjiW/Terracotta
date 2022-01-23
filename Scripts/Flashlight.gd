extends Light2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	if get_parent().sprite.flip_h == true:
		scale.x = -2
		position.x = -200
	else:
		scale.x = 2
		position.x = 200
