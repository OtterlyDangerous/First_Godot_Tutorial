extends Sprite2D

var speed: int = 400
var angular_speed = PI

func _process(delta):
	# Make it spin
	rotation += angular_speed * delta
	# Make it move
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	
