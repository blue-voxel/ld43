extends "res://script/sprite/_HexDirection.gd"

func _process(delta):
	_set_direction(inMap.get_look(null, true, true))
