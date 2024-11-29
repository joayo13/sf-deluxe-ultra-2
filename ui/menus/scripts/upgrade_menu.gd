extends CanvasLayer
@onready var upgrade_one: Label = $TextureRect/UpgradeOne
@onready var upgrade_two: Label = $TextureRect2/UpgradeTwo
@onready var upgrade_three: Label = $TextureRect3/UpgradeThree

var level_ups: Array[int]
var upgrades = ["poison", "fire", "water", "dark", "metal", "apple", "orange"]

func _ready() -> void:
	var upgrades_copy = upgrades.duplicate()
	var random_upgrade_int_one = randi_range(0, upgrades_copy.size() - 1)
	upgrade_one.text = upgrades[random_upgrade_int_one]
	upgrades_copy.remove_at(random_upgrade_int_one)
	var random_upgrade_int_two = randi_range(0, upgrades_copy.size() - 1)
	upgrade_two.text = upgrades[random_upgrade_int_two]
	upgrades_copy.remove_at(random_upgrade_int_two)
	var random_upgrade_int_three = randi_range(0, upgrades_copy.size() - 1)
	upgrade_two.text = upgrades[random_upgrade_int_three]
	
	
	#get 3 random upgrades for level_ups[0]
	#apply selected upgrade
	#if level_ups.length > 1 remove level_ups[0] and call parents instantiation function recursively

	

func apply_upgrade():
	if level_ups.size() > 1:
		level_ups.remove_at(0)
		var game_node = get_parent()
		if game_node.has_method("queue_upgrade_menu"):
			game_node.queue_upgrade_menu(level_ups)
	elif level_ups.size() == 1:
		GameManager.unpause_game()
	self.queue_free()
func _on_select_upgrade_one_button_button_down() -> void:
	apply_upgrade()
func _on_select_upgrade_two_button_button_down() -> void:
	apply_upgrade()
func _on_select_upgrade_three_button_button_down() -> void:
	apply_upgrade()
