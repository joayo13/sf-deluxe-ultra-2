extends Button




func _on_timer_timeout() -> void:
	if self.text:
		self.text = ''
	else:
		self.text = 'START GAME'
