extends Node

const COLLISION_LAYERS = {
    'friendly_static' : 0, #static obstacles affecting friendlies (should be the same as 'enemy_static' in almost all cases)
    'friendly_character' : 1,
    'friendly_health_mod' : 2, #things that modify health of friendlies, usually attacks
    'enemy_static' : 10,
    'enemy_character' : 11,
    'enemy_health_mod' : 12
}

const layer_count = 20

func normalise_deg(angle):
    if 0 < angle:
        return 360 - angle
    return -angle

func denormalise_deg(angle):
    if 180 < angle:
        return 360 - angle
    else:
        return -angle

func layer_of(name):
    return COLLISION_LAYERS[name]

func bodies_share_layer(from, to, layer = null):
    if layer:
        var i = layer_of(layer)
        return (from.get_collision_layer_bit(i) and to.get_collision_mask_bit(i))
    for i in range(layer_count):
        if  (from.get_collision_layer_bit(i) and to.get_collision_mask_bit(i)):
            return true
    return false

