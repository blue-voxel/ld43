extends "res://scripts/sprite/Dir_animator.gd"

func _process(delta):
	direction = inMap.get_look(null, true, true)
	._process(delta)
