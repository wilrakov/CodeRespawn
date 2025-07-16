extends CharacterBody2D

const SPEED = 360.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 800.0

func _physics_process(delta):
	# Appliquer la gravité
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	# Mouvement gauche/droite
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = direction * SPEED

	# Saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
