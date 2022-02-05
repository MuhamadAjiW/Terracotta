extends KinematicBody2D

onready var sprite = $Sprite
onready var coll = $Coll
onready var hitbox = $Area2D/Coll
onready var animation = $EffectsPlayer

onready var screechSfx1 = $Sound/Screech1
onready var screechSfx2 = $Sound/Screech2
onready var screechSfx3 = $Sound/Screech3
onready var hitSfx = $Sound/Hit
onready var sprintSfx = $Sound/StepQuick
onready var walkSfx = $Sound/Step
onready var jumpSfx = $Sound/Jump

const gravitasi = 25
const gravitasiMax = 400
var velocity :Vector2

func _ready():
	pass
	
func _physics_process(delta):
	#gravitasi
	if velocity.y < gravitasiMax:
		velocity.y += gravitasi
	elif velocity.y > gravitasiMax:
		velocity.y += (gravitasi/5)
		
	if is_on_floor():
		velocity.x = lerp(velocity.x,0,0.2)
	elif is_on_floor() == false:
		velocity.x = lerp(velocity.x,0,0.08)
	
	velocity = move_and_slide(velocity, Vector2(0,-1), true)
	#hadapan
	if velocity.y == 0 and velocity.x == 0:
		sprite.play("default")
		if walkSfx.is_playing() == true:
			walkSfx.stop()
		if sprintSfx.is_playing() == true:
			sprintSfx.stop()
	elif is_on_floor() and velocity.x != 0:
		if (velocity.x > 250 or velocity.x < -250):
			sprite.play("sprint")
				
			if walkSfx.is_playing() == true:
				walkSfx.stop()
			if sprintSfx.is_playing() == false:
				sprintSfx.play()
				
		elif (velocity.x < 250 or velocity.x > -250):
			sprite.play("walk")
				
			if sprintSfx.is_playing() == true:
				sprintSfx.stop()
			if walkSfx.is_playing() == false:
				walkSfx.play()
				
	elif is_on_floor() == false:
		if velocity.y < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
				
	if velocity.x > 0:
		sprite.flip_h = false
		coll.scale.x = 1
		hitbox.scale.x = 1
	elif velocity.x < 0:
		sprite.flip_h = true
		coll.scale.x = -1
		hitbox.scale.x = -1
	
	if $Area2D.overlaps_body($"/root/Global".player):
		$"/root/Global".audio.death_end()
