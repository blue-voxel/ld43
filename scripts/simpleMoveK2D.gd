extends KinematicBody2D

export (float) var topSpeed = 32 #maximum speed
export (float) var damping = 0.5 #time (seconds) to reach top speed

var cutoff = 0.1 #acceptable threshold to target speed
var vel = Vector2()
var col

func _ready():
	topSpeed /= 12 #idk why it just works
	pass

func _physics_process(delta):
	var target = inMap.move * topSpeed if not col else Vector2()
	if 0 < damping:
		var dVel = target - vel #difference between target velocity and current velocity
		if cutoff < dVel.length_squared(): 
			vel += dVel.normalized() * topSpeed * delta / damping #normalized() ensures that acceleration is constant (not proportional to distance to target)
		else:
			vel = target
	else:
		vel = target
	
	col = move_and_collide(vel)
	print (target)
		
	pass
