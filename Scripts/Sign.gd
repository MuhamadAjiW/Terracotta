extends Area2D

onready var delayTimer = $delayTimer
onready var scene_tree: = get_tree()
onready var text_overlay: = $CanvasLayer/ColorRect
var called = false
var open = false

func delay():
	if delayTimer.is_stopped():
		delayTimer.start(0.5)
func _on_delayTimer_timeout():
	called = false

func _input(event):
	if overlaps_body($"/root/Global".player):
		if open == true:
			if Input.is_action_pressed("Down") or Input.is_action_pressed("Escape"):
				open = false
				$CanvasLayer/ColorRect.visible = false
				$"/root/Global".pausemenu.enable_pause()
				$"/root/Global".inventorymenu.enable_pause()
				get_tree().paused = false
				
		elif $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			if called == false:
				get_tree().paused = true
				$"/root/Global".player.event_triggered("sign")
				$Use.play()
				delay()
				if open == false:
					$CanvasLayer/ColorRect.visible = true
					$"/root/Global".pausemenu.disable_pause()
					$"/root/Global".inventorymenu.disable_pause()
					open = true
			called = true
