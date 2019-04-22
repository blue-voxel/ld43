extends "res://scripts/KB2D/_SimpleMove.gd"

func _physics_process(delta):
    .move(inMap.move * topSpeed, delta)