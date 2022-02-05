extends Node

var player
var inventory
var audio
var inventorymenu
var pausemenu
var door_name = null

var direction = 1

func register_player(in_player):
	player = in_player
	
func register_inventory(itemname):
	inventory = itemname

func register_inventorymenu(itemname):
	inventorymenu = itemname

func register_pausemenu(itemname):
	pausemenu = itemname

func register_audioplayer(itemname):
	audio = itemname

func caching_start():
	direction = $"/root/Global".player.direction

func _ready():
	pass

