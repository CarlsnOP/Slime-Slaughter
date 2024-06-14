extends Area2D

const RANGE: float = 1200.
const SPEED: float = 1000.0

var _travelled_distance = 0

func _physics_process(delta):
	var _direction = Vector2.RIGHT.rotated(rotation)
	position += _direction * SPEED * delta
	
	_travelled_distance += SPEED * delta
	if _travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
