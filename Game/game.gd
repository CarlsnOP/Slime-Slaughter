extends Node2D

var _game_over: bool = false

func spawn_mob() -> void:
	var _new_monster = preload("res://Monster/monster.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	_new_monster.global_position = %PathFollow2D.global_position
	add_child(_new_monster)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	_game_over = true
	%GameOver.visible = true
	get_tree().paused = true


func _on_button_pressed():
	get_tree().paused = false
	%GameOver.visible = false
	get_tree().reload_current_scene()
