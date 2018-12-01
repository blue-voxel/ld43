#script must be added as a singleton in Project-Settings to function properly
extends Node 

var joypad = false

var move = Vector2()
var look = 0.0

func _ready():
    
    pass

func _process(delta):
	joypad = 0 < len(get_connected_joypads())
	get_move()
	pass

func get_move():
	move = Vector2()
	move.x += float(Input.is_action_pressed('ui_right'))
	move.x -= float(Input.is_action_pressed('ui_left'))
	move.y += float(Input.is_action_pressed('ui_down'))
	move.y -= float(Input.is_action_pressed('ui_up'))
	
	if joypad:
		move.x += Input.get_joy_axis(0,0)
		move.y += Input.get_joy_axis(0,1)
	
	if 1 < move.length_squared():
		move = move.normalized()
	return move

func get_look(from):
	if joypad:
		look = Vector2( Input.get_joy_axis(0,2),Input.get_joy_axis(0,3)).angle()
	else:
		mouse = get_viewport().get_mouse_position()
		if from:
			look = mouse.angle_to(from)
		else:
			look = mouse.angle()
	look = rad2deg(look)
	return look
