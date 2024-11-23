extends Node2D
class_name RangedWeapon
signal shooting
@export var projectile_time: float
@export var projectile_speed: float
@export var projectile_damage_min: int
@export var projectile_damage_max: int
@export var projectile_crit_chance: float
@export var projectile_crit_multiplier: int = 2
@export var projectile_pierce_amount: int
@export var layers: Array[int] = []
const LASER_ROUND = preload("res://weapons/ranged_weapons/laser_round.tscn")

func shoot(angle: float) -> void:
	var roundTemp = LASER_ROUND.instantiate()
	roundTemp.projectile_time = projectile_time
	roundTemp.projectile_speed = projectile_speed
	roundTemp.projectile_angle = angle
	roundTemp.projectile_damage_min = projectile_damage_min
	roundTemp.projectile_damage_max = projectile_damage_max
	roundTemp.projectile_crit_chance = projectile_crit_chance
	roundTemp.projectile_crit_multiplier = projectile_crit_multiplier
	roundTemp.projectile_pierce_amount = projectile_pierce_amount 
	roundTemp.layers = layers
	roundTemp.global_position = get_parent().global_position
	get_parent().get_parent().add_child(roundTemp)
