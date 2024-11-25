extends CharacterBody2D
@onready var ranged_weapon: Node2D = $RangedWeapon
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var farticles: CPUParticles2D = $Farticles
@onready var hurtbox: Area2D = $Hurtbox
var max_speed_y = 50
var max_speed_x = 25.0 

func _ready():
	if hurtbox != null:
		hurtbox.hit.connect(hit)
	if ranged_weapon != null:
		ranged_weapon.shooting.connect(play_shoot_anim)
	else:
		print("weapon_slot is null, unable to connect.")
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		var player_screen_coordinates = self.get_global_transform_with_canvas().origin
		var angle_between_player_and_event = player_screen_coordinates.angle_to_point(event.position)
		var angle_degrees = rad_to_deg(angle_between_player_and_event) * -1
		ranged_weapon.shoot(angle_degrees)
		
func play_shoot_anim(_angle):
	pass
func hit(attack):
	var health_component = get_node("HealthComponent") as HealthComponent
	health_component.take_damage(attack)
	print("owie")
func _process(_delta: float) -> void:
	var accelerometer_x = Input.get_accelerometer().x
	var target_velocity_x = 0.0
	if accelerometer_x < -0.7 || Input.is_action_pressed("ui_left"):
		animated_sprite_2d.flip_h = true
		target_velocity_x = accelerometer_x * max_speed_x
		target_velocity_x = -max_speed_x
		velocity.x = lerp(velocity.x, target_velocity_x, 0.1)
	elif accelerometer_x > 0.7 || Input.is_action_pressed("ui_right"):
		animated_sprite_2d.flip_h = false
		target_velocity_x = accelerometer_x * max_speed_x
		target_velocity_x = max_speed_x
		velocity.x = lerp(velocity.x, target_velocity_x, 0.1)
		
	
	else:
		if(velocity.x != 0):
			velocity.x = lerp(velocity.x, 0.0, 0.1)

	# Move vertically at a constant speed (if required)
	velocity.y = -max_speed_y  # Modify or remove this line if you'd like vertical movement with acceleration too

	# Move the character using the velocity
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("fly")
