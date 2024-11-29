extends RigidBody2D
@onready var despawn_timer: Timer = $DespawnTimer
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var area_2d: Area2D = $Area2D
var projectile_data: Projectile
var projectile_angle: float = 0.0  # Angle in degrees
var direction: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var angle_radians = deg_to_rad(projectile_angle)
	direction = Vector2(cos(angle_radians), -sin(angle_radians))
	despawn_timer.wait_time = projectile_data.projectile_time
	despawn_timer.start()
	if projectile_data.layers:
		for layer in projectile_data.layers:
			area_2d.set_collision_layer_value(layer, true)
			area_2d.set_collision_mask_value(layer, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void: 
	linear_velocity = direction * projectile_data.projectile_speed

func _on_despawn_timer_timeout() -> void:
	cpu_particles_2d.one_shot = true

func _on_cpu_particles_2d_finished() -> void:
	self.queue_free()
		
func _on_area_2d_area_entered(area) -> void:
	if area is Hurtbox:
		var attack = Attack.new()
		attack.damage = randi_range(projectile_data.projectile_damage_min, projectile_data.projectile_damage_max)
		attack.position = global_position
		attack.knockback = 0.0
		if randi_range(1, 100)< self.projectile_data.projectile_crit_chance:
			attack.damage = attack.damage * self.projectile_data.projectile_crit_multiplier
		area.take_hit(attack)
