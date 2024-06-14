extends Node2D

@onready var animation_player = %AnimationPlayer

func play_idle_animation():
	animation_player.play("idle")


func play_walk_animation():
	animation_player.play("walk")
