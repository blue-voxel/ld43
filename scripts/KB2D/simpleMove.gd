extends KinematicBody2D

export (float) var topSpeed = 32 #maximum speed
export (float) var damping = 0.5 #time (seconds) to reach top speed

var cutoff = 0.1 #acceptable threshold to target speed
var vel = Vector2()

func move(target, delta):
    if 0 < damping:
        var dVel = target - vel #difference between target velocity and current velocity
        if cutoff < dVel.length_squared(): 
            vel += dVel.normalized() * topSpeed * delta / damping #normalized() ensures that acceleration is constant (not proportional to distance to target). Note that this line affects acceleration, not speed
        else:
            vel = target
    else:
        vel = target
    
    move_and_slide(vel)

func _ready():
	pass

func _physics_process(delta):
	pass
