extends Node2D

var called = false
<<<<<<< HEAD
var sparkling = false
export(String) var itemname = ""

func sparkle():
	sparkling = true
	$AnimationPlayer.play("sparkle")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play_backwards("sparkle")
	yield($AnimationPlayer, "animation_finished")
	sparkling = false

func _ready():
	if $"/root/Global".inventory.get_node(itemname).visible == true:
		queue_free()


func _process(delta):
	if sparkling == false:
		sparkle()
	if $Detector.overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			if called == false:
				called = true
				$"/root/Global".player.event_triggered("itemholder")
					
				$"/root/Global".inventory.get_node(itemname).visible = true
				
				if $Taken.playing == false:
					$Taken.play()


func _on_Taken_finished():
	queue_free()
=======

func _ready():
	pass # Replace with function body.

func _process(delta):
	if $Detector.overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			$"/root/Global".player.event_triggered("itemholder")
				
			print("Item taken")
				
			queue_free()
>>>>>>> 12aa47a5b834fe17869339c52eafc094b4d7ab00
