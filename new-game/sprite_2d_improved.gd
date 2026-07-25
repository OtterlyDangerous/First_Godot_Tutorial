extends Sprite2D

var speed: int = 400
var angular_speed = PI


func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	visible = not visible


func _on_button_pressed() -> void:
	set_process(not is_processing())


func _process(delta):
	# Make it turn
	var direction = 0
	if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		direction = -1
	elif Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		direction = 1
	rotation += angular_speed * delta * direction
	# Make it move
	if Input.is_action_pressed("ui_up"):
		var velocity = Vector2.UP.rotated(rotation) * speed
		position += velocity * delta
