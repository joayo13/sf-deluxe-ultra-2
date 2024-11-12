extends CharacterBody2D

@export var max_speed: float = 40.0  # Maximum speed of the enemy movement
@export var acceleration: float = 5.0  # Rate of acceleration
@export var deceleration: float = 5.0  # Rate of deceleration
@export var min_interval: float = 2.0  # Minimum time before changing direction
@export var max_interval: float = 3.0  # Maximum time before changing direction

@onready var direction_change_timer: Timer = $DirectionChangeTimer

# Set up the initial target speed and direction
var target_speed: float = 0.0
var direction: int = 0

func _ready() -> void:
	# Start the timer with a random interval# Randomly returns -1 or 1
	var right = randi_range(0, 1)
	if right:
		direction = 1
	else:
		direction = -1
	direction_change_timer.start(randf_range(min_interval, max_interval))

func _process(delta: float) -> void:
	# Determine the target speed based on the current direction
	target_speed = direction * max_speed
	# Use lerp to smoothly adjust the current velocity towards the target speed
	if target_speed == 0:
		# Decelerate towards zero
		velocity.x = lerp(velocity.x, target_speed, deceleration * delta)
	else:
		# Accelerate towards the target speed
		velocity.x = lerp(velocity.x, target_speed, acceleration * delta)

	# Move the enemy
	move_and_slide()

func _on_direction_change_timer_timeout() -> void:
	# Change direction and restart the timer with a new random interval
	direction *= -1
	direction_change_timer.start(randf_range(min_interval, max_interval))
	get_node("WeaponSlot").shoot(-90)
