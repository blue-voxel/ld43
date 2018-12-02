extends Node2D

export (PackedScene) var attack
export (float) var cooldown = 1
export (float) var delay = 0

const offset = 6

func _process(delta):
	if Input.is_action_just_pressed('primary_attack'):
		print ('fire')
		_fire(get_parent().direction)

func _fire(direction):
	var ak = attack.instance()
	ak.get_node("Sprite")._set_direction(direction)

	direction = deg2rad(direction)
	ak.position = get_global_transform().get_origin()
	ak.position -= Vector2(cos(direction), sin(direction)) * offset
	get_parent().get_parent().get_parent().add_child(ak) #not ideal but it should work until something drastic changes
	


