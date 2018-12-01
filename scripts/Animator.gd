extends Sprite

export (bool) var flipX = false

var direction

var sliceX
var sliceY
var texX
var texY

func _ready():
	if region_enabled:
		sliceX = region_rect.size.x
		sliceY = region_rect.size.y
		texX = texture.get_width()/sliceY
		texY = texture.get_height()/sliceY
	else:
		print ("error: region must be enabled")
	pass

func _process(delta):
	direction = inMap.get_look(null, true, true)

	if 300 < direction:
		region_rect.position.x = sliceX
		flip_h = flipX
	elif 240 < direction:
		region_rect.position.x = 0
		flip_h = flipX
	elif 180 < direction:
		region_rect.position.x = sliceX
		flip_h = not flipX
	elif 120 < direction:
		region_rect.position.x = sliceX * 2
		flip_h = not flipX
	elif 60 < direction:
		region_rect.position.x = sliceX * 3
	else:
		region_rect.position.x = sliceX * 2
		flip_h =  flipX

