extends Bullet


func _on_area_2d_area_entered(area) -> void:
	if area is Hurtbox:
		var attack = Attack.new()
		attack.damage = projectile_damage
		attack.position = global_position
		attack.knockback = 0.0
		area.take_hit(attack)
