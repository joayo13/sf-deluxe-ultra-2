extends Control
@onready var label: Label = $Label
var gold: int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = '+' + str(gold)
	var tween = label.create_tween()
	var rise = label.position + Vector2(0, randi_range(-10, -16))  # 20 pixels up
	var fall = label.position
	# Animate the position property of the label to move it up
	var duration = 0.4
	tween.tween_property(self, "position", rise, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", fall, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.tween_property(self, "modulate:a", 0, 0.2).finished
	self.queue_free()
