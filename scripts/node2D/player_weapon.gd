extends Node2D

export (PackedScene) var attack
export (float) var delay = 0

signal add_to_world(node)

const offset = 6

var ready = true

func _process(delta):
	if Input.is_action_just_pressed('primary_attack'):
		_fire(get_parent().direction)

func _fire(direction):
	if(ready):
		ready = false
		var ak = attack.instance()
		ak.get_node("Sprite")._set_direction(direction)

		direction = deg2rad(utils.denormalise_deg(direction))
		ak.position = get_global_transform().get_origin()
		ak.position += Vector2(cos(direction), sin(direction)) * offset
		emit_signal('add_to_world', ak)
		$cooldown.start()

func set_ready():
	ready = true

