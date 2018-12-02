extends Area2D

export (float) var speed = 50
export (float) var damage

var transpose


func _ready():
	var direction = deg2rad(utils.denormalise_deg($Sprite.direction))
	transpose = Vector2(cos(direction), sin(direction)) * speed
	pass

func _process(delta):
	position += transpose * delta
