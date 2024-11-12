extends Area2D
class_name Hurtbox
signal hit




func take_hit(attack: Attack):
	assert(attack.position)
	emit_signal("hit", attack)
	
