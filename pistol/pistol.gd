extends Area2D


func _physics_process(delta):
	var _enemies_in_range = get_overlapping_bodies()
	
	if _enemies_in_range.size() > 0:
		var _target_enemy = _enemies_in_range.front()
		look_at(_target_enemy.global_position)

func shoot() -> void:
	const BULLET = preload("res://bullet/bullet.tscn")
	var _new_bullet = BULLET.instantiate()
	_new_bullet.global_position = %ShootingPoint.global_position
	_new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(_new_bullet)

func _on_timer_timeout():
	shoot()
