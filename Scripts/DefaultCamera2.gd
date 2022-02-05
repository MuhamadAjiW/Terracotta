extends Camera2D

export(float) var threshold = 150
export(float) var speed = 0.025
export(float) var offsetX = 0
export(float) var offsetY = -200

func _ready():
	self.position.x = offsetX
	self.position.y = offsetY

func input_processing():
	if Input.is_action_pressed("Up") and Input.is_action_pressed("Down"):
		pass
	elif Input.is_action_pressed("Up"):
		self.position.y = lerp(self.position.y,offsetY - threshold,speed)
	elif Input.is_action_pressed("Down"):
		self.position.y = lerp(self.position.y,offsetY + threshold,speed)
	else:
		self.position.y = lerp(self.position.y,offsetY,speed)
	
	if Input.is_action_pressed("Right") and Input.is_action_pressed("Left"):
		pass
	elif Input.is_action_pressed("Right"):
		self.position.x = lerp(self.position.x,offsetX + threshold,speed)
	elif Input.is_action_pressed("Left"):
		self.position.x = lerp(self.position.x,offsetX - threshold,speed)
	else:
		self.position.x = lerp(self.position.x,offsetX,speed)

func _process(delta):
	input_processing()
