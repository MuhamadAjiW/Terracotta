extends Node2D

var called = false
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
