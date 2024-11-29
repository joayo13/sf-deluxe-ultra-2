extends Node
@onready var main_menu: Control = $MainMenu
const GAME_LOADING_SCREEN = preload("res://game/scenes/game_loading_screen.tscn")
const UPGRADE_MENU = preload("res://ui/menus/scenes/upgrade_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu.connect("start_game", start_game)
	GameManager.connect("level_up", queue_upgrade_menu)
	
func start_game():
	var game_loading_screen = GAME_LOADING_SCREEN.instantiate()
	game_loading_screen.scene_name = "res://levels/level1/scenes/level_one.tscn"
	self.add_child(game_loading_screen)
	main_menu.queue_free()
func queue_upgrade_menu(level_ups):
	GameManager.pause_game()
	var upgrade_menu = UPGRADE_MENU.instantiate()
	upgrade_menu.level_ups = level_ups
	self.add_child(upgrade_menu)
	
	
	
	
