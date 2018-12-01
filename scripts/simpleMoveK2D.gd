extends KinematicBody2D

export (float) var topSpeed = 32 #maximum speed
export (float) var damping = 0.5 #time (seconds) to reach top speed

var cutoff = 0.1 #acceptable threshold to target speed
var vel = Vector2()
var time = 0.0
var prev = Vector2()
func _ready():
	topSpeed /= 12 #idk why it just works
	pass

func _physics_process(delta):
	time += delta
	if 0.2 < time:
		print (position - prev)
		prev = position
		
		time = 0
	var target = inMap.move * topSpeed
	if 0 < damping:
		var dVel = target - vel #difference between target velocity and current velocity
		if cutoff < dVel.length_squared(): 
			vel += dVel.normalized() * topSpeed * delta / damping #normalized() ensures that acceleration is constant (not proportional to distance to target)
		else:
			vel = target
	else:
		vel = target
	
	move_and_collide(vel)
	pass
