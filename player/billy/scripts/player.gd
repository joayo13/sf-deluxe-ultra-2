extends CharacterBody2D
@onready var weapon_slot: Node2D = $WeaponSlot
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var farticles: CPUParticles2D = $Farticles
@onready var hurtbox: Area2D = $Hurtbox

var max_speed_y = 50.0
var max_speed_x = 100.0   
var acceleration = 5.0    # Rate of acceleration
var deceleration = 5.0    # Rate of deceleration

func _ready():
	if hurtbox != null:
		hurtbox.hit.connect(hit)
	if weapon_slot != null:
		weapon_slot.shooting.connect(shoot)
	else:
		print("weapon_slot is null, unable to connect.")
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		var player_screen_coordinates = self.get_global_transform_with_canvas().origin
		var angle_between_player_and_event = player_screen_coordinates.angle_to_point(event.position)
		print(rad_to_deg(angle_between_player_and_event))
		get_node("WeaponSlot").shoot(rad_to_deg(angle_between_player_and_event) * -1)
	
func shoot():
	animated_sprite_2d.animation = "shoot"
func hit(attack):
	var health_component = get_node("HealthComponent") as HealthComponent
	health_component.take_damage(attack)
	print("owie")
func _process(delta: float) -> void:
	var input_direction = Vector2.ZERO

	# Check input and set direction
	if Input.is_action_pressed("ui_left"):
		input_direction.x = -1
		animated_sprite_2d.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		input_direction.x = 1
		animated_sprite_2d.flip_h = false

	# Apply acceleration when moving
	if input_direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, input_direction.x * max_speed_x, acceleration * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, deceleration * delta)

	# Move vertically at a constant speed (if required)
	velocity.y = -max_speed_y  # Modify or remove this line if you'd like vertical movement with acceleration too

	# Move the character using the velocity
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("fly")
