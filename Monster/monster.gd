extends CharacterBody2D


@onready var player = get_node("/root/Game/Player")


var _health: int = 3
var _speed: float = 300.0


func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var _direction = global_position.direction_to(player.global_position)
	velocity = _direction * _speed
	move_and_slide()

func take_damage() -> void:
	_health -= 1
	%Slime.play_hurt()
	
	if _health == 0:
		queue_free()
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
