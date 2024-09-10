extends CharacterBody2D

var score:int = 0

const SPEED = 400.0
const JUMP_VELOCITY = -575.0


func _physics_process(delta):

	if not is_on_floor():
		velocity += get_gravity() * delta
		$AnimatedSprite2D.play("jump")


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = direction < 0 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$AnimatedSprite2D.play("idle")

	move_and_slide()
