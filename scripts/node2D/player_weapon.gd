extends  "res://scripts/node2D/weapon.gd"

func _process(delta):
	if Input.is_action_pressed('primary_attack'):
		_fire(get_parent().direction)