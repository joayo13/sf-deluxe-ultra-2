extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func playerCollectGoldCoin() -> void:
	animated_sprite_2d.animation = 'collected'

func _on_animated_sprite_2d_animation_finished() -> void:
	self.queue_free()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	playerCollectGoldCoin()
	if _body.has_node("FloatingText"):
		_body.get_node("FloatingText").createFloatingTextGoldPopup(randi_range(1, 16))
