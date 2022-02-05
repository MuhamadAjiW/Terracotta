extends Node2D

var called = false

func _ready():
	pass # Replace with function body.

func death_end():
	called = true
	
	$"/root/Global".pausemenu.disable_pause()
	$"/root/Global".inventorymenu.disable_pause()
	get_tree().paused = true
	
	get_node("Animal call").play()
	$Death/CanvasLayer/ColorRect.visible = true
	yield(get_tree().create_timer(0.1), "timeout")
	$Death/CanvasLayer/ColorRect.visible = false
	yield(get_tree().create_timer(0.05), "timeout")
	$Death/CanvasLayer/ColorRect.visible = true
	yield(get_tree().create_timer(0.05), "timeout")
	$Death/CanvasLayer/ColorRect.visible = false
	yield(get_tree().create_timer(0.05), "timeout")
	$Death/CanvasLayer/ColorRect.visible = true
	
	get_node("Giggledisorted").play()
	
	$Death/CanvasLayer/ColorRect/Sprite.visible = true
	yield(get_tree().create_timer(0.1), "timeout")
	$Death/CanvasLayer/ColorRect/Sprite.visible = false
	yield(get_tree().create_timer(0.05), "timeout")
	$Death/CanvasLayer/ColorRect/Sprite.visible = true
	yield(get_tree().create_timer(0.05), "timeout")
	$Death/CanvasLayer/ColorRect/Sprite.visible = false
	yield(get_tree().create_timer(0.05), "timeout")
	$Death/CanvasLayer/ColorRect/Sprite.visible = true
	
	yield(get_node("Giggledisorted"), "finished")
	get_tree().quit()
