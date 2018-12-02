extends Area2D

export (float) var speed = 50
export (float) var damage

var transpose


func _ready():
	var direction = deg2rad(utils.denormalise_deg($Sprite.direction))
	transpose = Vector2(cos(direction), sin(direction)) * speed
	pass

func _physics_process(delta):
	if 0 < len(get_overlapping_bodies()):
		on_hit(get_overlapping_bodies()[0])
	position += transpose * delta


func on_hit(body):
	print (body)
	die()

func die():
	queue_free()

func damage(amount):
	die()


func _on_hit(body):
	pass # replace with function body
