extends Node
class_name HealthComponent

@export var health: float = 10

func take_damage(attack: Attack):
	health -= attack.damage
	print(health)
