extends Node2D
const LASER_ROUND = preload("res://weapons/ranged_weapons/laser_round.tscn")
@export var layers: Array[int] = []
signal shooting
# Called when the node enters the scene tree for the first time.
	
func shoot(angle: float):
		if get_child(0) && get_child(0).has_method('shoot'):
			get_child(0).layers = layers
			get_child(0).shoot(LASER_ROUND, angle)
			emit_signal("shooting", angle)
			
