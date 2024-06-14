extends CharacterBody2D

signal health_depleted


@onready var happy_boo = %HappyBoo

const DAMAGE_RATE: = 50.0

var _health: float = 100.0
var _speed: float = 600.0

func _physics_process(delta):
	var _direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = _direction * _speed
	move_and_slide()
	play_animation()
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		_health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = _health
		if _health <= 0.0:
			health_depleted.emit()


func play_animation() -> void:
	if velocity.length() > 0.0:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
