extends Node2D

var called = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if $Detector.overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			$"/root/Global".player.event_triggered("itemholder")
				
			print("Item taken")
				
			queue_free()
