extends "res://scripts/KB2D/simpleMove.gd"

func _physics_process(delta):
    .move(inMap.move * topSpeed, delta)