extends "res://script/kb2d/_SimpleMove.gd"

func _physics_process(delta):
    .move(inMap.move * topSpeed, delta)