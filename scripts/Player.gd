extends KinematicBody2D

var velocity : Vector2 = Vector2.ZERO

export var gravity := 10.0
export var speed := 1000.0

func _physics_process(delta):
	vertical_movement()
	horizontal_movement()
	velocity = move_and_slide(velocity)
	animation_control()

func horizontal_movement():
	var horizontal_strength = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = speed * horizontal_strength

func vertical_movement():
	if (velocity.y < speed):
		velocity.y += gravity
	else:
		velocity.y = speed

func _on_frog_area_entered(area):
	velocity.y = 0
	velocity.y -= speed * 1.5
	velocity = move_and_slide(velocity)

func animation_control():
	if velocity.y > 0:
		$AnimatedSprite.play("fall")
	else:
		$AnimatedSprite.play("jump")
