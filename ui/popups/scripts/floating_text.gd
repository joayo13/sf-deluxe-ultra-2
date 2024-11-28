class_name FloatingText
extends Node
const FLOATING_TEXT_XP = preload("res://ui/popups/scenes/floating_text_xp.tscn")
const FLOATING_TEXT_DAMAGE = preload("res://ui/popups/scenes/floating_text_damage.tscn")
func create_floating_text_xp(xp: int):
	var new_popup = FLOATING_TEXT_XP.instantiate()
	new_popup.xp = xp
	new_popup.global_position = self.global_position
	get_parent().get_parent().add_child(new_popup)
	
func create_floating_text_damage(damage: float):
	var new_popup = FLOATING_TEXT_DAMAGE.instantiate()
	new_popup.damage = damage
	new_popup.global_position = self.global_position
	get_parent().get_parent().add_child(new_popup)
	
	
	
