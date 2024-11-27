extends Node

var gold: int = 0
var player_level: int = 0
var level_experience: int = 0
var level_experience_max: int = 100
signal level_up

func add_experience(experience_amount: int):
	level_experience += experience_amount
	if level_experience >= level_experience_max:
		level_experience = level_experience - level_experience_max
		emit_signal("level_up", player_level)
	
