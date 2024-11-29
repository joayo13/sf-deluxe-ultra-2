extends Node

var player_level: int = 0
var level_experience: int = 0
var level_experience_maxes: Array[int] = [20, 50, 80, 125, 200, 300, 450, 650, 1000]
var level_ups: Array[int]
signal level_up

func add_experience(experience_amount: int):
	print(experience_amount)
	level_experience += experience_amount
	handle_level_up()
	
func handle_level_up():
	if level_experience >= level_experience_maxes[player_level]:
		while level_experience >= level_experience_maxes[player_level]:
			level_experience = level_experience - level_experience_maxes[player_level]
			player_level += 1
			level_ups.append(player_level)
			print("level_up")
		emit_signal("level_up", level_ups)
		level_ups = []
		
func pause_game():
	Engine.time_scale = 0
func unpause_game():
	Engine.time_scale = 1

	
