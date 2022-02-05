extends Area2D

var called = false
var called2 = false
var called3 = false

var ending = false
var ending2 = false

var cache_camera_x
var cache_camera_y

func _ready():
	pass # Replace with function body.

func endscene():
	print("4")
	$"/root/Global".player.velocity.x = -0.01
	yield(get_tree().create_timer(3), "timeout")
	
	if $"/root/Global".inventory.get_node("Item11").visible == false:
		ending = true
	
	elif $"/root/Global".inventory.get_node("Item11").visible == true:
		ending2 = true
		
		get_parent().get_node("Enemy1").velocity.x = 700
		if $"/root/Global".audio.get_node("Themedisorted").is_playing():
			$"/root/Global".audio.get_node("Themedisorted").stop()
		
		$CanvasLayer/ColorRect.visible = true
		yield(get_tree().create_timer(0.2), "timeout")
		get_parent().material.set_light_mode(0)
		$CanvasLayer/ColorRect.visible = false
		yield(get_tree().create_timer(1), "timeout")
		$CanvasLayer/ColorRect.visible = true
		yield(get_tree().create_timer(0.2), "timeout")
		$CanvasLayer/ColorRect.visible = false
		yield(get_tree().create_timer(1), "timeout")
		$CanvasLayer/ColorRect.visible = true
		get_parent().get_node("Background").visible = false
		get_parent().get_node("Background2").visible = true
		$CanvasLayer/AnimationPlayer.play_backwards("fade")
		yield($CanvasLayer/AnimationPlayer, "animation_finished")
		$CanvasLayer/ColorRect.visible = false
		yield(get_tree().create_timer(1), "timeout")
		

		
		get_parent().get_node("Enemy1").animation.play("Dead")
		yield(get_parent().get_node("Enemy1").animation, "animation_finished")
		get_parent().get_node("Enemy1").queue_free()
		
		Input.action_press("Up")
		$CanvasLayer/ColorRect.visible = true
		$CanvasLayer/AnimationPlayer.play("fade")
		yield($CanvasLayer/AnimationPlayer, "animation_finished")
		yield(get_tree().create_timer(4), "timeout")
		get_parent().get_parent().transition("res://Scenes/Goodbye.tscn")




func _process(delta):
	if overlaps_body($"/root/Global".player) and called == false:
		cache_camera_x = get_parent().get_node("Player/Camera").global_position.x
		cache_camera_y = get_parent().get_node("Player/Camera").global_position.y

		called = true
		print("1")
		$"/root/Global".player.event_triggered("cutscene")
		$"/root/Global".player.cutscene = true
		$"/root/Global".pausemenu.disable_pause()
		$"/root/Global".inventorymenu.disable_pause()
		
		get_parent().get_node("Enemy1").get_node("AI").queue_free()
	
	elif called == true and called2 == false:
		yield(get_tree().create_timer(1), "timeout")
		Input.action_press("Right")
		called2 = true
	
	elif called2 == true and called3 == false:
		print("2")
		if get_parent().get_node("Enemy1").global_position.x < $"/root/Global".player.global_position.x - 300:
			get_parent().get_node("Enemy1").velocity.x = 100
		elif not get_parent().get_node("Enemy1").global_position.x < $"/root/Global".player.global_position.x - 300:
			Input.action_release("Right")
			print("3")
			called3 = true
			endscene()
		
	if ending == true:
		get_parent().get_node("Enemy1").velocity.x = 700
	
	elif ending2 == true:
		pass
