extends "res://scripts/sprite/Dir_animator.gd"

func _process(delta):
	_set_direction(inMap.get_look(null, true, true))
