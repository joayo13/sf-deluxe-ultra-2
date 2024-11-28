extends Node
@onready var main_menu: Control = $MainMenu
const GAME_LOADING_SCREEN = preload("res://game/scenes/game_loading_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu.connect("start_game", start_game)
	
func start_game():
	var game_loading_screen = GAME_LOADING_SCREEN.instantiate()
	game_loading_screen.scene_name = "res://levels/level1/scenes/level_one.tscn"
	self.add_child(game_loading_screen)
	main_menu.queue_free()
	
	
