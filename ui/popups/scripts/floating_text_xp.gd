extends Control
@onready var label: Label = $Label
var xp: int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = '+' + str(xp) + 'xp'
	var tween = label.create_tween()
	var rise = label.global_position + Vector2(0, -20)  # 20 pixels up
	# Animate the position property of the label to move it up
	var duration = 0.4
	tween.tween_property(self, "global_position", rise, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await tween.tween_property(self, "modulate:a", 0, 0.2).finished
	self.queue_free()
