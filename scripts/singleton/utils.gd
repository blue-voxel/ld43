extends Node

func normalise_deg(angle):
    if 0 < angle:
        return 360 - angle
    return -angle

func denormalise_deg(angle):
    if 180 < angle:
        return 360 - angle
    else:
        return -angle