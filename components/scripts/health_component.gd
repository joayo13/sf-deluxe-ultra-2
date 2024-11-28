extends Node
class_name HealthComponent
signal dead
@export var health: float = 10

func take_damage(attack: Attack):
	health -= attack.damage
	if health <= 0:
		emit_signal("dead")
