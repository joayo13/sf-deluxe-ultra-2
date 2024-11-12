extends Node
const FLOATING_TEXT_GOLD = preload("res://ui/popups/scenes/floating_text_gold.tscn")

func createFloatingTextGoldPopup(goldAmount: int):
	var newPopup = FLOATING_TEXT_GOLD.instantiate()
	newPopup.gold = goldAmount
	self.add_child(newPopup)
	
	
	
