extends Control
signal start_game

func _on_start_button_button_down() -> void:
	emit_signal("start_game")
