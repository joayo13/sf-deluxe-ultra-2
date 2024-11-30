extends Control


func _on_confirm_button_button_down() -> void:
	get_parent().apply_upgrade()


func _on_cancel_button_button_down() -> void:
	$"../SelectUpgradeMenu".visible = true
	self.visible = false
	
