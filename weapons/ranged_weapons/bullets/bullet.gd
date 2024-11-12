class_name Bullet
extends Node2D
@onready var despawn_timer: Timer = $DespawnTimer
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var area_2d: Area2D = $Area2D
var projectile_time: float
var projectile_speed: float
var projectile_damage: float
var projectile_angle: float = 0.0  # Angle in degrees
var pierce_amount: float 
var direction: Vector2;
var layers: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var angle_radians = deg_to_rad(projectile_angle)
	direction = Vector2(cos(angle_radians), -sin(angle_radians))
	despawn_timer.wait_time = projectile_time
	despawn_timer.start()
	if layers:
		for layer in layers:
			area_2d.set_collision_layer_value(layer, true)
			area_2d.set_collision_mask_value(layer, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	position += direction * projectile_speed
	
	


func _on_despawn_timer_timeout() -> void:
	cpu_particles_2d.one_shot = true


func _on_cpu_particles_2d_finished() -> void:
	self.queue_free()
		
