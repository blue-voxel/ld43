extends "res://script/sprite/_HexDirection.gd"

export (float) var framerate = 1
export (bool) var reflect = false

var time = 0
var frame_duration
var reflecting

func _ready():
    ._ready()
    frame_duration = 1 / framerate
    _set_direction(direction)

func _process(delta):
    time += delta
    
    if frame_duration < time:
        if sliceY * (texY-1) <= region_rect.position.y:
            if reflect:
                reflecting = true
            else:
                region_rect.position.y = -sliceY
        region_rect.position.y += sliceY * (-1 if reflecting else 1)
        if reflecting and region_rect.position.y < sliceY:
            reflecting = false
        
        time -= frame_duration
