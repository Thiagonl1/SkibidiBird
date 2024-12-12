extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D
func _process(delta: float) -> void:
	camera.position.y = 0
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	print(rotation_degrees)
	if not is_on_floor():
		velocity += get_gravity() * delta
		if(rotation_degrees <= 70):
			rotation_degrees = rotation_degrees + 2
		else:
			rotation_degrees = 70
	if(rotation_degrees < -50):
		animated_sprite.play("flap")
	else:
		animated_sprite.play("flying")
	camera.position.y = 0

	# Handle jump.
	if Input.is_action_just_pressed("Saltar"):
		velocity.y = JUMP_VELOCITY
		rotation_degrees = -70
	velocity.x = SPEED
	move_and_slide()
