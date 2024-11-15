class_name FloatingText
extends Node
const FLOATING_TEXT_GOLD = preload("res://ui/popups/scenes/floating_text_gold.tscn")
const FLOATING_TEXT_DAMAGE = preload("res://ui/popups/scenes/floating_text_damage.tscn")
func createFloatingTextGoldPopup(gold_amount: int):
	var newPopup = FLOATING_TEXT_GOLD.instantiate()
	newPopup.gold = gold_amount
	self.add_child(newPopup)
	
func createFloatingTextDamage(damage: float):
	var newPopup = FLOATING_TEXT_DAMAGE.instantiate()
	newPopup.damage = damage
	self.add_child(newPopup)
	
	
	
