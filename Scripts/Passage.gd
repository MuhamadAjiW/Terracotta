extends Area2D

export(String) var path = ""

func _ready():
	pass # Replace with function body.


func _process(delta):
	if overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			Global.door_name = name
			get_parent().get_parent().transition(path)
