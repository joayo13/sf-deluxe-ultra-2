extends Control
@onready var label: Label = $Label
var damage: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(damage)
	var tween = label.create_tween()
	var random_x_range = randi_range(-20, 20)
	var random_y_range = randi_range(-10, -16)
	var rise = label.global_position + Vector2(random_x_range, random_y_range)  # 20 pixels up
	var fall = label.global_position - Vector2(-random_x_range, random_y_range)
	# Animate the position property of the label to move it up
	var duration = 0.4
	tween.tween_property(self, "global_position", rise, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", fall, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.tween_property(self, "modulate:a", 0, 0.2).finished
	self.queue_free()
