extends Node

class_name Life, "res://image/dev/heart.svg"
export (int) var life = 1

#TODO add warnings
#TODO add button which connects on_killed signal to queue_free method on parent
signal on_hit
signal on_killed

func damage(amount):
    emit_signal("on_hit")
    life -= amount
    if life <= 0:
        emit_signal("on_killed")
