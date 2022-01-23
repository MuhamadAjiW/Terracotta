extends Node

var player
var door_name = null

var direction = 1

func register_player(in_player):
	player = in_player

func caching_start():
	direction = $"/root/Global".player.direction

func _ready():
	pass

