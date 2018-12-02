extends Node2D

export (PackedScene) var attack
export (float) var firerate = 1
export (float) var delay = 0

const offset = 6

var fire_delay

func _ready():
	fire_delay = 1 / firerate
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func fire(direction):
	var ak = attack.instance()
	ak._set_direction(direction)

	direction = deg2rad(direction)
	var setpos = position + Vector2(cos(direction), sin(direction)) * offset
	ak.position = setpos
	get_parent().get_parent().get_parent().add_child(ak) #not ideal but it should work until something drastic changes
	


