extends RangedWeapon


func shoot(ROUND: PackedScene, angle: float) -> void:
	var leftRound = ROUND.instantiate()
	var centerRound = ROUND.instantiate()
	var rightRound = ROUND.instantiate()
	var rounds: Array = [leftRound, centerRound, rightRound]
	angle = angle - 30
	for i in range(rounds.size()):
		rounds[i].projectile_time = projectile_time
		rounds[i].projectile_speed = projectile_speed
		rounds[i].projectile_angle = angle + (15 * (i + 1))
		rounds[i].projectile_damage_min = projectile_damage_min
		rounds[i].projectile_damage_min = projectile_damage_max
		rounds[i].layers = layers
		rounds[i].global_position = get_parent().get_parent().global_position
		get_parent().get_parent().get_parent().add_child(rounds[i])
