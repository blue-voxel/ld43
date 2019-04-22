extends Area2D

export (float) var speed = 50
export (float) var damage

var transpose = Vector2(0, 0) #this should be set to the velocity of the parent. I don't yet know what the best way to do that is.

func _ready():
	var direction = deg2rad(utils.denormalise_deg($Sprite.direction))
	transpose += Vector2(cos(direction), sin(direction)) * speed
	pass

func _physics_process(delta):
	position += transpose * delta

func test(body):
	print(body)

func _on_hit(body):
	var life = body.get_node_or_null("Life")
	if life:
		life.damage(damage)
	die()

func die():
	queue_free()
