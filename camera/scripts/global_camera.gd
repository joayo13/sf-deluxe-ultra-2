extends Camera2D
@onready var player: CharacterBody2D = $"../Player"
var target: Node
func _ready():
	if player:
		target = player
		global_position.y = target.global_position.y
		global_position.x = target.global_position.x
	assert(target)

func _process(_delta):
	global_position.y = target.global_position.y
