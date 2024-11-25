extends Resource
class_name Projectile
@export var projectile_time: float
@export var projectile_speed: float
@export var projectile_damage_min: int
@export var projectile_damage_max: int
@export var projectile_crit_chance: float
@export var projectile_crit_multiplier: float = 2
@export var projectile_angle: float = 0.0  # Angle in degrees
@export var projectile_pierce_amount: float 
@export var layers: Array[int]
