extends Node2D
class_name RangedWeapon
signal shooting
@export var projectile: Projectile
const BULLET = preload("res://weapons/ranged_weapons/scenes/bullet.tscn")

func shoot(angle: float) -> void:
	var bullet = BULLET.instantiate()
	bullet.projectile_angle = angle
	bullet.projectile_data = projectile
	bullet.global_position = get_parent().global_position
	get_parent().get_parent().add_child(bullet)
