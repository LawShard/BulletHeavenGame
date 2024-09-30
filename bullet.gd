extends Area2D
var bulletLevel
var damage = bulletLevel * 10
var travelled_distance = 0

func _ready():
	bulletLevel = Globalscript.level
	
func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	bulletLevel = Globalscript.level

	damage = bulletLevel
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
		
