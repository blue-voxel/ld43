extends Area2D

export (float) var speed = 50
export (float) var damage

var transpose = Vector2(0, 0) #this should be set to the velocity of the parent. I don't yet know what the best way to do that is.

func _ready():
	var direction = deg2rad(utils.denormalise_deg($Sprite.direction))
	transpose += Vector2(cos(direction), sin(direction)) * speed
	pass

func _physics_process(delta):
	var hits = get_overlapping_bodies()
	if (	0 < len(hits) and\
			utils.bodies_share_layer(self, hits[0])):
		_on_hit(hits[0])
	position += transpose * delta


func _on_hit(body):
	die()

func die():
	queue_free()
