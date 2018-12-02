extends Node2D

export (PackedScene) var attack

signal add_to_world(node)

const offset = 6

var ready = true

func _fire(direction):
	if not ready:
		return
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

