#script must be added as a singleton in Project-Settings to function properly
extends Node 

var move = Vector2()

func _ready():
    
    pass

func _process(delta):
	move = Vector2()
	move.x += float(Input.is_action_pressed('ui_right')) + Input.get_joy_axis(0,0)
	move.x -= float(Input.is_action_pressed('ui_left'))
	move.y += float(Input.is_action_pressed('ui_down')) + Input.get_joy_axis(0,1)
	move.y -= float(Input.is_action_pressed('ui_up'))
	
	if 1 < move.length_squared():
		move = move.normalized()
	pass

func get_move():
	return move
