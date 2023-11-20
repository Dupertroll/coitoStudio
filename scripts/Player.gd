extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 750
@onready var sprite = $Sprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		velocity.x = direction * SPEED
		sprite.frame = 4
	
	elif direction == 1:
		velocity.x = direction * SPEED
		sprite.frame = 2
	
	else:
		sprite.frame = 0
		velocity.x = move_toward(velocity.x, 0, SPEED) # para detenerlo 

	move_and_slide()
