extends Node2D
@export var projectile_speed: float = 2
@export var projectile_time: float = 0.2
@export var projectile_angle: float = 0.0
@export var projectile_damage: float = 1.0
var layers: Array = []


func shoot(ROUND: PackedScene, angle: float) -> void:
	var roundTemp = ROUND.instantiate()
	roundTemp.projectile_time = projectile_time
	roundTemp.projectile_speed = projectile_speed
	roundTemp.projectile_angle = angle
	roundTemp.projectile_damage = projectile_damage
	roundTemp.layers = layers
	#player node
	roundTemp.global_position = get_parent().get_parent().global_position
	#level node
	get_parent().get_parent().get_parent().add_child(roundTemp)
