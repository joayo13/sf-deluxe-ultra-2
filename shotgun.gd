extends Node2D
@export var projectile_speed: float = 2
@export var projectile_time: float = 0.2
@export var projectile_angle: float = 0.0
@export var projectile_damage: float = 1.0
var layers: Array = []


func shoot(ROUND: PackedScene, angle: float) -> void:
	var leftRound = ROUND.instantiate()
	var centerRound = ROUND.instantiate()
	var rightRound = ROUND.instantiate()
	var rounds: Array = [leftRound, centerRound, rightRound]
	angle = angle - 30
	for i in range(rounds.size()):
		rounds[i].projectile_time = projectile_time
		rounds[i].projectile_speed = projectile_speed
		rounds[i].projectile_angle = angle + (15 * (i + 1))
		rounds[i].projectile_damage = projectile_damage
		rounds[i].layers = layers
		rounds[i].global_position = get_parent().get_parent().global_position
		get_parent().get_parent().get_parent().add_child(rounds[i])
