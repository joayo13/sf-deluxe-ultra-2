extends RangedWeapon


func shoot(ROUND: PackedScene, angle: float) -> void:
	var roundTemp = ROUND.instantiate()
	roundTemp.projectile_time = projectile_time
	roundTemp.projectile_speed = projectile_speed
	roundTemp.projectile_angle = angle
	roundTemp.projectile_damage_min = projectile_damage_min
	roundTemp.projectile_damage_max = projectile_damage_max
	roundTemp.projectile_crit_chance = projectile_crit_chance
	roundTemp.projectile_crit_multiplier = projectile_crit_multiplier
	roundTemp.projectile_pierce_amount = projectile_pierce_amount 
	roundTemp.layers = layers
	roundTemp.global_position = get_parent().get_parent().global_position
	get_parent().get_parent().get_parent().add_child(roundTemp)
